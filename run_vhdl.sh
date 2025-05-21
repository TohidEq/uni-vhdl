#!/bin/bash

# Script to run VHDL simulation with GHDL and GTKWave

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <source_vhdl_file> [-arith]"
    echo "Example: $0 ABC.vhd -arith"
    exit 1
fi

# Variables
SRC_FILE=$1
BASENAME=$(basename "$SRC_FILE" .vhd)
TB_FILE="${BASENAME}_tb.vhd"
TOP_ENTITY="${BASENAME}_tb"
WAVEFORM="waveform.vcd"
GHDL="ghdl"
GHDLFLAGS="--std=08"
GTKWAVE="gtkwave"

# Optional: Add -fsynopsys if -arith is passed
if [[ "$@" =~ "-arith" ]]; then
    GHDLFLAGS+=" -fsynopsys"
fi

# Check if files exist
if [ ! -f "$SRC_FILE" ]; then
    echo "Error: Source file $SRC_FILE not found!"
    exit 1
fi
if [ ! -f "$TB_FILE" ]; then
    echo "Error: Testbench file $TB_FILE not found!"
    exit 1
fi

# Analyze VHDL files
echo "Analyzing $SRC_FILE and $TB_FILE..."
$GHDL -a $GHDLFLAGS "$SRC_FILE" "$TB_FILE"
if [ $? -ne 0 ]; then
    echo "Analysis failed!"
    exit 1
fi

# Elaborate the testbench
echo "Elaborating $TOP_ENTITY..."
$GHDL -e $GHDLFLAGS "$TOP_ENTITY"
if [ $? -ne 0 ]; then
    echo "Elaboration failed!"
    exit 1
fi

# Run the simulation
echo "Running simulation..."
$GHDL -r $GHDLFLAGS "$TOP_ENTITY" --vcd="$WAVEFORM"
if [ $? -ne 0 ]; then
    echo "Simulation failed!"
    exit 1
fi

# Open waveform in GTKWave
if [ -f "$WAVEFORM" ]; then
    echo "Opening waveform in GTKWave..."
    $GTKWAVE "$WAVEFORM" &
else
    echo "Error: Waveform file $WAVEFORM not generated!"
    exit 1
fi

echo "Done!"
