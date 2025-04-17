#!/bin/bash

import os
import re
delay = 10

def find_vhdl_file():
    """Find the first .vhd file in the current directory."""
    for file in os.listdir('.'):
        if file.endswith('.vhd') and not file.endswith('_tb.vhd'):
            return file
    return None

def parse_vhdl_entity(file_path):
    """Parse VHDL file to extract entity name and ports."""
    with open(file_path, 'r') as f:
        content = f.read()

    # Find entity declaration
    entity_match = re.search(r'entity\s+(\w+)\s+is', content, re.IGNORECASE)
    if not entity_match:
        raise ValueError("No entity found in VHDL file")
    entity_name = entity_match.group(1)

    # Find port declaration
    port_match = re.search(r'port\s*\((.*?)\);', content, re.DOTALL | re.IGNORECASE)
    if not port_match:
        raise ValueError("No port declaration found in VHDL file")
    port_text = port_match.group(1)

    # Parse ports
    ports = []
    for port_line in port_text.split(';'):
        port_line = port_line.strip()
        if not port_line:
            continue
        # Match port name(s), direction, and type
        port_def = re.match(r'(\w+(?:\s*,\s*\w+)*)\s*:\s*(in|out)\s*(\w+)', port_line, re.IGNORECASE)
        if port_def:
            names = [name.strip() for name in port_def.group(1).split(',')]
            direction = port_def.group(2).lower()
            port_type = port_def.group(3)
            for name in names:
                ports.append({'name': name, 'direction': direction, 'type': port_type})

    return entity_name, ports

def generate_testbench(entity_name, ports):
    """Generate testbench VHDL code."""
    tb_name = f"{entity_name}_tb"
    # Header
    tb_content = """library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity {} is
end {};

architecture Behavioral of {} is
    -- Testbench signals
""".format(tb_name, tb_name, tb_name)

    # Declare signals
    signals = []
    for port in ports:
        signals.append(f"    signal {port['name']} : {port['type']};")
    tb_content += '\n'.join(signals) + '\n\n'

    # Component declaration
    tb_content += f"    -- Component declaration\n    component {entity_name}\n        port (\n"
    port_decls = []
    for port in ports:
        port_decls.append(f"            {port['name']} : {port['direction']} {port['type']}")
    tb_content += ';\n'.join(port_decls) + "\n        );\n    end component;\n\n"

    # Begin architecture
    tb_content += "begin\n    -- Instantiate the Unit Under Test (UUT)\n"
    tb_content += f"    uut: {entity_name} port map (\n"
    port_maps = []
    for port in ports:
        port_maps.append(f"        {port['name']} => {port['name']}")
    tb_content += ',\n'.join(port_maps) + "\n    );\n\n"

    # Stimulus process (for STD_LOGIC inputs only)
    inputs = [port['name'] for port in ports if port['direction'] == 'in' and port['type'].lower() == 'std_logic']
    if inputs:
        tb_content += "    -- Stimulus process\n    stim_proc: process\n    begin\n"
        tb_content += "        for i in 1 to 3 loop\n"
        for combo in range(2 ** len(inputs)):
            binary = format(combo, f'0{len(inputs)}b')
            for i, input_name in enumerate(inputs):
                tb_content += f"            {input_name} <= '{binary[i]}'; "
            tb_content += f"wait for {delay} ns;\n"
        tb_content += "        end loop;\n        wait;\n    end process;\n"
    else:
        tb_content += "    -- Stimulus process\n    stim_proc: process\n    begin\n        wait;\n    end process;\n"

    tb_content += "end Behavioral;\n"
    return tb_name, tb_content

def main():
    # Find VHDL file
    vhdl_file = find_vhdl_file()
    if not vhdl_file:
        print("Error: No VHDL source file found in the current directory (excluding *_tb.vhd files).")
        return

    try:
        # Parse VHDL file
        entity_name, ports = parse_vhdl_entity(vhdl_file)
        print(f"Found VHDL file: {vhdl_file}, Entity: {entity_name}")

        # Generate testbench
        tb_name, tb_content = generate_testbench(entity_name, ports)
        tb_filename = f"{tb_name}.vhd"

        # Write testbench to file
        with open(tb_filename, 'w') as f:
            f.write(tb_content)
        print(f"Testbench generated: {tb_filename}")

    except Exception as e:
        print(f"Error: {str(e)}")

if __name__ == "__main__":
    main()