1. File > New Project > Create New File (masir pishfarz avaz nashavad)
2. Compile > compile ALL
3. Simulation > Select File > Simulate
4. Roye harkodom az signala(A, B, Sum, Cout) Right click > Add wave
5. Right click roye A,B > Force > 0,0
6. Click on "RUN" (btn, in top bar)
7. set A=1 (force) > RUN
8. set A=0, B=1 (force) > RUN
9. set A=1, B=1 (force) > RUN
10. Simulation > End Simlation (tosieh mishavad in kar ra anjam dahim ta oon hafezeii ke taskhis dade shode aazad beshe)

signal sharti:
tamam shart ha hamzaman barresi mishavad

```vhdl
WITH s SELECT
  z <= a WHEN '1',
       b WHEN '0'
       c WHEN OTHERS;
```

---

RS FlipFlop

S R - Q Qprim
0 1 - 0 1
1 1 - 0 1
1 0 - 1 0
1 1 - 1 1
0 0 - Error Gheyre Mojaaz

---

D FlipFlop

D CLK Q
if CLK==1 : Q <= D

---

D FlipFlop + ResetPIN

D CLK RST Q
if RST==1 : Q <= 0
elseif CLK==1 : Q <= D

---

**clk'event**
be in (') migan Attribute

- ('left)
- ('right)
- ('high)
- ('low)
- ('length)
- ('last_event)
- ('ascending)

### (X'range), (X'reverse_range)

range o reverse range ro migan sefate baaze goo

```lua
for i integer range 3 downto 0 loop,
for i in 3 downto 0 loop,


-- (`a` Signal hast [3 downto 0])

for i in a'range loop
-- (alan in `a` dare az 3 ta 0 mire va in i ham mesle in `a` mishe)
-- (tedad bit haye `a` 4 taast)

for i in a'reverse_range loop;
-- (age `a` az 3 be 0 taghir mikone vali)
-- (mikham `i` az 0 be 3 taghir kone)

```

### `exit [barchasb][when Shart]`

Kholaase: exit az Loop.
barchasb ekhtiarie, (barchabe marboot be loop)
when Shart ekhtiarie.

```lua

proccess(a)
  variable int_a:integer;
  begin
    int_a:=n;
    for i in 0 to 50 loop
      if ()
      .... edaame daarad

```

### `next [barchasb][when Shart]`

Kholaase: moaadele countinue, mesle exit

```lua

for i in 0 to 50 loop
  if blah blah blah
    next;
  else
    done...blah blah
  end if;
end loop;

```

### `while ... loop`

ebteda sharti test mishe, ta vaghti shart dorost bashe loop edame peyda mikone
vaghti shart baatel she, loop tamom mishe

```lua
while error_flag='0' loop
  clk := NOT clk after 50ns;
end loop
```

### simple `loop`

Hich moshakhasaati nadare, Yani ta binahayat ejra mishe,
bayad ye raveshi baraye khoroj az halghe daashte bashim,
mesle estefade az `exit[xx][xx]`

!!! taa akhare FILE-8 jozve emtehaan ast !!!
