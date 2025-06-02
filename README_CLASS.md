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

### TestBench

12,3,1404

toye test bench entity nadarim
toye test bench time haii ke mizarim
az mabdae zaman hesaab mishe

after 5ns
after 10ns
after 20ns

yaani:

```
20ns
----------
5ns
---
---   ----
  |  |    |
  ----    -----
------
10ns
```

testbench ghaabele santez nist o faghat baraye simulation hastand.

- **az inja be paaiin ro AI nevesht :D**

### Assert

توضیح کوتاه درباره assert در VHDL:

دستور assert برای بررسی صحت شرط‌ها (مثلاً در تست‌بنچ‌ها) استفاده می‌شود. اگر شرطی که بررسی می‌کند برقرار نباشد، پیام خطا می‌دهد.

کاربرد در تست‌بنچ:

در برنامه‌های تست‌بنچ (testbench)، از assert استفاده می‌کنیم تا مطمئن شویم خروجی طراحی همان چیزی هست که انتظار داشتیم. مثلاً:

```vhdl
Copy
Edit
assert (output_signal = expected_value)
  report "Test failed: Output is not as expected"
  severity error;
```

اگر شرط برقرار نباشد (output_signal = expected_value درست نباشد)، پیام چاپ می‌شود و با severity می‌توان تعیین کرد که چقدر مهم است (مثلاً warning, error, failure).

agar shart False she, peyghaam ersaal mishe o

serity error ro ham neshon mide:

- note
- warning
- error (pishfarz)
- failre

بعد از پیغام ریپورت، متوقف میشه در صورتی که روی ارور یا فیلور ست شده باشه؟؟ (خوب نشنیدم)

بعد از ریپورت هر استرینگی که مد نظر هست رو میتونیم بیاریم

### type Charcter

dar beyne 2 ta `'` gharar dadeh mishe

### type String

dar beyne yek joft `"`

### For Generate

sakhtafzaari az dastoor `for loop`

baraye tekrar ya copy ghesmati az sakhtafzaar

عبارت **`for generate`** در VHDL برای **تولید چند نمونه تکراری از یک سخت‌افزار یا کد مشابه** استفاده می‌شه، مثلاً برای تولید چند بیت از یک رجیستر، جمع‌کننده، یا گیت.

---

### 🧠 کاربرد کلی:

```vhdl
gen_label: for i in 0 to N generate
  -- کدی که قراره تکرار بشه
end generate;
```

---

### ✅ مثال کاربردی: تولید 8 گیت AND برای یک بیت‌بردار

فرض کن می‌خوای 8 تا گیت AND داشته باشی که بیت‌های دو ورودی رو با هم AND کنه:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and8 is
  Port (
    a, b : in  STD_LOGIC_VECTOR(7 downto 0);
    y    : out STD_LOGIC_VECTOR(7 downto 0)
  );
end and8;

architecture Behavioral of and8 is
begin
  gen_and: for i in 0 to 7 generate
    y(i) <= a(i) and b(i);
  end generate;
end Behavioral;
```

---

### ✍️ نکته‌ها:

- `for generate` فقط داخل **architecture** استفاده می‌شه.
- می‌تونی ازش برای نمونه‌سازی چند باره از یک component هم استفاده کنی.
- می‌تونی داخلش `if ... generate` هم بیاری.

اگه بخوای مثال ترکیبی با component هم بزنم، بگو.

عبارت **`generic`** در VHDL برای تعریف **پارامترهای قابل تنظیم** طراحی استفاده می‌شه، مثل سایز بیت، تأخیر، یا هر چیزی که بخوای موقع استفاده مقدار بدی.

---

### ✅ کاربرد کلی:

```vhdl
entity my_module is
  generic (
    N : integer := 8  -- مقدار پیش‌فرض
  );
  port (
    a : in  std_logic_vector(N-1 downto 0);
    b : in  std_logic_vector(N-1 downto 0);
    y : out std_logic_vector(N-1 downto 0)
  );
end my_module;
```

در این مثال، `N` یک پارامتر قابل تنظیمه که سایز ورودی‌ها و خروجی رو مشخص می‌کنه.

---

### 🧪 استفاده در تست‌بنچ یا component:

```vhdl
uut: entity work.my_module
  generic map (
    N => 16  -- اینجا سایز بیت رو تعیین می‌کنیم
  )
  port map (
    a => a_sig,
    b => b_sig,
    y => y_sig
  );
```

---

### 🧠 مزایا:

- طراحی ما **قابل انعطاف** و **قابل استفاده مجدد** می‌شه.
- اگه یه بار ماژول بنویسی، می‌تونی با مقادیر مختلف دوباره ازش استفاده کنی.

---

### 🧵 ترکیب `generic` با `for generate`:

خیلی وقتا با هم میان، مثلاً برای تولید `N` عدد گیت:

```vhdl
architecture Behavioral of my_module is
begin
  gen_loop: for i in 0 to N-1 generate
    y(i) <= a(i) and b(i);
  end generate;
end Behavioral;
```

### Array

در VHDL، **آرایه (Array)** ساختاریه که می‌تونی باهاش مجموعه‌ای از داده‌ها رو مثل یه لیست یا جدول ذخیره کنی. معمولاً برای بردارهای بیتی، حافظه‌ها، رجیسترها و حتی ماتریس‌ها استفاده می‌شه.

---

### ✅ دو نوع رایج آرایه:

#### 1. **آرایه استاندارد (مثل `std_logic_vector`)**

این خودش یک آرایه از `std_logic`هاست:

```vhdl
signal data : std_logic_vector(7 downto 0);
```

این یعنی آرایه‌ای از 8 بیت از نوع `std_logic`.

---

#### 2. **آرایه دلخواه (با `array` تعریف شده)**

اگه بخوای آرایه‌ای از بردارها یا از انواع دلخواه بسازی، باید نوع (type) تعریف کنی:

##### مثال: آرایه‌ای از بردارهای 8 بیتی (مثل حافظه)

```vhdl
type byte is array(7 downto 0) of std_logic;
type memory is array(0 to 15) of byte;  -- 16 بایت حافظه

signal ram : memory;
```

یا ساده‌تر با `std_logic_vector`:

```vhdl
type mem_array is array(0 to 15) of std_logic_vector(7 downto 0);
signal ram : mem_array;
```

---

### 🧪 استفاده از آرایه:

```vhdl
-- نوشتن مقدار در خانه‌ای از آرایه:
ram(0) <= "10101010";

-- خواندن یک بیت خاص از یک خانه خاص:
some_bit <= ram(3)(2);  -- بیت دوم از خانه سوم
```

---

### 💡 نکات کاربردی:

| کاربرد | نوع آرایه                                  |
| ------ | ------------------------------------------ |
| رجیستر | `std_logic_vector` یا `array of std_logic` |
| حافظه  | `array of std_logic_vector`                |
| ماتریس | `array of array`                           |

---

اگه بخوای آرایه‌ای از componentها (مثلاً جمع‌کننده یا فلیپ‌فلاپ) درست کنی با `for generate`، بگو تا اونم نشون بدم.

عالی! بریم سراغ دو کار مهم در VHDL با آرایه‌ها:

---

## 🧩 1. **چسباندن آرایه‌ها (Concatenation)**

در VHDL، برای چسباندن (یا به‌اصطلاح **پیوستن**) آرایه‌ها از **عملگر `&`** استفاده می‌کنیم.

### ✨ مثال ساده:

```vhdl
signal a : std_logic_vector(3 downto 0) := "1101";
signal b : std_logic_vector(3 downto 0) := "0011";
signal c : std_logic_vector(7 downto 0);

c <= a & b;  -- خروجی: "11010011"
```

> ترتیب مهمه: `a & b` یعنی `a` در بیت‌های بالا قرار می‌گیره و `b` در پایین.

---

### ✅ چسباندن یک بیت با بردار:

```vhdl
signal d : std_logic := '1';
signal e : std_logic_vector(3 downto 0) := "0110";

signal f : std_logic_vector(4 downto 0);
f <= d & e;  -- f = "10110"
```

---

## 🧪 2. **مقایسه آرایه‌ها**

برای مقایسه دو آرایه (مثل `std_logic_vector`) می‌تونی مستقیماً از عملگرهای مقایسه استفاده کنی:

| عملگر             | معنی                     |
| ----------------- | ------------------------ |
| `=`               | مساوی                    |
| `/=`              | نامساوی                  |
| `<`،`>`،`<=`،`>=` | مقایسه ترتیبی (برای عدد) |

### 📘 مثال:

```vhdl
signal x : std_logic_vector(3 downto 0) := "1010";
signal y : std_logic_vector(3 downto 0) := "1010";
signal z : boolean;

z <= (x = y);  -- نتیجه: true
```

> نکته: اگر از `std_logic_vector` به عنوان **عدد** استفاده می‌کنی، باید اول به `unsigned` یا `signed` تبدیل کنی:

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

signal a, b : std_logic_vector(7 downto 0);

if unsigned(a) > unsigned(b) then
  -- ...
end if;
```

---

حتماً! بریم سراغ **آرایه‌ای از آرایه‌ها** در VHDL، که معمولاً برای ساختارهای مثل **ماتریس‌ها** یا **حافظه‌های چندبعدی** استفاده می‌شن.

---

## 🧠 تعریف آرایه‌ای از آرایه (آرایه دوبعدی)

برای ساخت آرایه دوبعدی (مثلاً ماتریس یا حافظه‌ای با چند سطر و ستون)، باید ابتدا نوع داده داخلی (مثلاً یک سطر) رو تعریف کنیم، بعد نوع آرایه بیرونی (مثلاً کل ماتریس).

---

### ✅ مثال: ماتریس 4×8 از بیت‌ها

#### تعریف نوع‌ها:

```vhdl
type row_type is array(7 downto 0) of std_logic;      -- سطر 8 بیتی
type matrix_type is array(0 to 3) of row_type;        -- 4 سطر
```

#### تعریف سیگنال:

```vhdl
signal my_matrix : matrix_type;
```

---

### 🧪 استفاده:

#### مقداردهی:

```vhdl
my_matrix(0) <= "10101010";  -- سطر اول
my_matrix(3)(2) <= '1';      -- خانه سطر چهارم، ستون سوم
```

#### خواندن مقدار:

```vhdl
signal bit_val : std_logic;
bit_val <= my_matrix(1)(5);  -- بیت شماره 5 از سطر دوم
```

---

## ✨ مثال واقعی‌تر: حافظه 16×8

```vhdl
type byte is std_logic_vector(7 downto 0);         -- یک بایت
type memory is array(0 to 15) of byte;             -- حافظه 16 بایتی

signal ram : memory;
```

#### استفاده:

```vhdl
ram(0) <= "00001111";        -- نوشتن در خانه 0
signal some_bit : std_logic;
some_bit <= ram(3)(2);       -- بیت سوم از خانه چهارم
```

---

## 📌 نکته‌ها

| نکته         | توضیح                                                                 |
| ------------ | --------------------------------------------------------------------- |
| چندبعدی‌سازی | با تودرتو کردن نوع‌ها (`type of type`) انجام می‌شه.                   |
| محدودیت      | فقط می‌تونی تا دو بعد منطقی بسازی؛ ابعاد بالاتر معمولاً توصیه نمی‌شن. |
| مقایسه       | باید هر خانه رو جداگانه مقایسه کنی یا حلقه بسازی.                     |

---

اگه خواستی مثال عملی از جمع ماتریس‌ها، ذخیره/خواندن در حافظه یا generate برای ماتریس هم بنویسم، فقط بگو.

در VHDL نمی‌تونیم واقعاً یک آرایه **نامحدود (infinite)** تعریف کنیم چون VHDL یک زبان سخت‌افزاریه و باید همیشه **محدوده‌ی مشخص** برای آرایه‌ها داشته باشیم (برای سنتز روی سخت‌افزار هم الزامیه).

اما می‌تونیم یه آرایه‌ای تعریف کنیم که **طولش موقع استفاده قابل تعیین باشه** با کمک `**unconstrained array**`.

---

## ✅ هدف تو: آرایه‌ای که هر عنصرش یک `std_logic_vector(7 downto 0)` باشه و طولش بعداً تعیین شه.

---

## 🧠 راه‌حل: استفاده از آرایه با طول نامشخص (Unconstrained Array Type)

### ✨ 1. تعریف نوع آرایه:

```vhdl
type byte is std_logic_vector(7 downto 0);  -- عنصر: یک بایت

-- آرایه‌ای با طول نامعین (index range بازه آزاد)
type byte_array is array(natural range <>) of byte;
```

> `range <>` یعنی موقع استفاده باید مشخص کنیم که آرایه چند عنصر داره.

---

### ✨ 2. تعریف سیگنال با طول مشخص:

مثلاً آرایه‌ای با 16 عنصر:

```vhdl
signal ram : byte_array(0 to 15);  -- 16 بایت
```

یا آرایه‌ای با 256 عنصر:

```vhdl
signal memory : byte_array(0 to 255);
```

---

### 🧪 استفاده:

```vhdl
memory(0) <= "10101010";
memory(10)(3) <= '1';  -- بیت سوم از عنصر دهم
```

---

## ⚠️ نکات مهم:

| مورد       | توضیح                                                       |
| ---------- | ----------------------------------------------------------- |
| `range <>` | فقط در **تعریف نوع** استفاده می‌شه، نه در سیگنال.           |
| در سیگنال  | باید **محدوده‌ی مشخص** بدی، حتی اگه نوعش نامحدود تعریف شده. |
| کاربرد     | در طراحی‌های عمومی، حافظه‌ها، ماژول‌های قابل پیکربندی.      |

---

اگر خواستی برات یه کامپوننت هم بنویسم که از این نوع آرایه استفاده کنه و مثلاً بشه طول حافظه رو با `generic` مشخص کرد، فقط بگو.

عالیه! در VHDL شما می‌تونی **type**های مخصوص خودت رو تعریف کنی تا طراحی‌هات قابل‌فهم‌تر، ساخت‌یافته‌تر و قابل‌استفاده‌ی مجدد بشن.

---

## 🧠 انواع `type` قابل تعریف در VHDL:

1. ✅ **Enumerated Type (نوع شمارشی)**
2. ✅ **Array Type (نوع آرایه‌ای)**
3. ✅ **Record Type (نوع رکوردی مثل struct در C)**

---

## 1. 🎯 Enumerated Type (نوع شمارشی)

برای تعریف مجموعه‌ای از مقادیر ممکن (مثلاً حالت‌های یک ماشین حالت):

```vhdl
type state_type is (IDLE, LOAD, EXECUTE, DONE);
signal state : state_type;
```

---

## 2. 📦 Array Type (نوع آرایه‌ای)

برای ساخت آرایه از نوع دلخواه:

```vhdl
type byte is std_logic_vector(7 downto 0);  -- یک بایت

-- آرایه‌ای از 16 بایت:
type mem16 is array(0 to 15) of byte;
signal ram : mem16;
```

یا آرایه با طول نامعین (unconstrained):

```vhdl
type byte_array is array(natural range <>) of byte;
```

---

## 3. 📚 Record Type (نوع رکوردی)

مثل `struct` در C: چند فیلد با نوع‌های متفاوت در یک بسته:

```vhdl
type instruction is record
  opcode : std_logic_vector(3 downto 0);
  operand : std_logic_vector(7 downto 0);
  flag : std_logic;
end record;

signal inst : instruction;
```

### استفاده:

```vhdl
inst.opcode  <= "1101";
inst.operand <= "10101010";
inst.flag    <= '1';
```

---

## 📌 کجا باید type تعریف کنیم؟

معمولاً در **بخش package** یا **در ابتدای architecture**. مثلاً:

```vhdl
architecture Behavioral of my_entity is

  type byte is std_logic_vector(7 downto 0);
  type mem_array is array(0 to 255) of byte;

  signal RAM : mem_array;

begin
  -- ...
end Behavioral;
```

---

## alias

دستور **`alias`** در VHDL برای **نام‌گذاری مجدد یک سیگنال، متغیر، یا عضو از نوع پیچیده** استفاده می‌شه، طوری که بتونی با یه اسم ساده‌تر بهش دسترسی پیدا کنی.

---

## ✅ کاربرد اصلی `alias`:

- ساده‌سازی دسترسی به بخش‌هایی از یک سیگنال یا ساختار پیچیده.
- افزایش خوانایی کد.
- جلوگیری از تکرار نوشتن مسیر کامل.

---

## ✨ ساختار کلی:

```vhdl
alias <اسم جدید> : <نوع> is <مقدار اصلی>;
```

---

## 🎯 مثال‌های رایج

### 1. **استفاده برای بیت خاص از سیگنال**

```vhdl
signal data : std_logic_vector(7 downto 0);
alias msb : std_logic is data(7);

msb <= '1';  -- این یعنی data(7) <= '1';
```

---

### 2. **روی عضو یک رکورد**

```vhdl
type instruction is record
  opcode : std_logic_vector(3 downto 0);
  operand : std_logic_vector(7 downto 0);
end record;

signal inst : instruction;
alias op : std_logic_vector(3 downto 0) is inst.opcode;

-- حالا به‌جای inst.opcode می‌نویسیم op
op <= "1100";
```

---

### 3. **روی عنصر آرایه**

```vhdl
type mem_type is array(0 to 15) of std_logic_vector(7 downto 0);
signal ram : mem_type;

alias first_byte : std_logic_vector(7 downto 0) is ram(0);
first_byte <= "11110000";
```

---

## ⚠️ نکته‌های مهم:

| مورد                                                         | توضیح |
| ------------------------------------------------------------ | ----- |
| فقط یک **اسم جایگزین**ه — خودش حافظه جدید نداره.             |       |
| **خوانا بودن کد** رو زیاد می‌کنه، مخصوصاً در caseهای پیچیده. |       |
| می‌تونی از `alias` در هر جایی از architecture استفاده کنی.   |       |

---

### Parity Bit

حتما! در ادامه توضیحی کوتاه و جامع درباره مفهوم **توازن (Balance)** و **Parity** در زمینه طراحی مدارات با زبان VHDL ارائه می‌دهم.

---

### توازن (Balance) در VHDL

توازن معمولاً در بحث سیگنال‌ها و بیت‌ها به معنی تعداد برابر یا متعادل بودن مقدار 0 و 1 است. به خصوص در طراحی سیستم‌های دیجیتال، داشتن سیگنال‌هایی با توازن مناسب (مثلاً تعداد مساوی بیت‌های 1 و 0) می‌تواند به بهبود ویژگی‌های الکتریکی مانند کاهش نویز و هم‌زمانی بهتر کمک کند.

مثلاً در ارسال داده‌های سریالی یا رمزگذاری‌ها، توازن بین بیت‌های 0 و 1 اهمیت دارد.

---

### Parity (توازن بیت) در VHDL

**Parity** یک بیت اضافی است که به یک مجموعه بیت اضافه می‌شود تا مشخص شود تعداد بیت‌های 1 در آن مجموعه، زوج است یا فرد.

دو نوع پاریتی داریم:

- **Parity زوج (Even Parity):** تعداد کل بیت‌های 1 (شامل بیت پاریتی) زوج باشد.
- **Parity فرد (Odd Parity):** تعداد کل بیت‌های 1 (شامل بیت پاریتی) فرد باشد.

این بیت برای تشخیص خطا در داده‌های منتقل شده استفاده می‌شود. اگر تعداد بیت‌های 1 هنگام دریافت با نوع پاریتی همخوانی نداشته باشد، خطا رخ داده است.

---

### مثال ساده VHDL برای تولید بیت Parity زوج

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parity_even is
    port (
        data_in  : in  std_logic_vector(7 downto 0);
        parity_bit : out std_logic
    );
end parity_even;

architecture rtl of parity_even is
begin
    process(data_in)
    variable count_ones : integer := 0;
    begin
        count_ones := 0;
        for i in data_in'range loop
            if data_in(i) = '1' then
                count_ones := count_ones + 1;
            end if;
        end loop;

        if (count_ones mod 2) = 0 then
            parity_bit <= '0';  -- تعداد 1 ها زوج است، پس بیت پاریتی 0
        else
            parity_bit <= '1';  -- تعداد 1 ها فرد است، بیت پاریتی 1
        end if;
    end process;
end rtl;
```

---

اگر بخواهی می‌توانم مثال برای **Parity فرد** یا چک کردن **Parity** در داده دریافتی هم بنویسم.

همچنین اگر بخواهی، تمرین‌های ساده با توضیح برای آموزش بهتر هم آماده کنم.

---

آها، می‌خوای از **نوع enumerated** برای تعریف وضعیت یا حالت بیت parity استفاده کنیم!
مثلاً به جای استفاده از `'0'` و `'1'` مستقیم، یک نوع شمارشی (enumeration type) تعریف کنیم که نام حالت‌های parity رو داشته باشه، مثل `Even` و `Odd` یا `Parity_0` و `Parity_1`.

---

## پیاده‌سازی Parity با نوع enumerated در VHDL

مثلاً اینطوری:

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity parity_even_enum is
    port (
        data_bus : in std_logic_vector(7 downto 0);
        parity_bit : out std_logic
    );
end parity_even_enum;

architecture rtl of parity_even_enum is

    -- تعریف نوع enumerated برای parity
    type parity_type is (Even, Odd);
    signal parity_status : parity_type;

    alias data : std_logic_vector(7 downto 0) is data_bus;

begin

    process(data)
        variable ones_count : integer := 0;
    begin
        ones_count := 0;
        for i in data'range loop
            if data(i) = '1' then
                ones_count := ones_count + 1;
            end if;
        end loop;

        -- تعیین parity_status با توجه به تعداد بیت 1
        if (ones_count mod 2) = 0 then
            parity_status <= Even;
        else
            parity_status <= Odd;
        end if;

        -- تبدیل parity_status به std_logic برای خروجی
        case parity_status is
            when Even => parity_bit <= '0';
            when Odd  => parity_bit <= '1';
        end case;

    end process;

end rtl;
```

---

### توضیح:

- `parity_type` یک نوع شمارشی با دو مقدار `Even` و `Odd` است.
- `parity_status` یک سیگنال از این نوع است که وضعیت پاریتی را نگه می‌دارد.
- بعد از محاسبه تعداد بیت‌های 1، مقدار `parity_status` ست می‌شود.
- سپس با استفاده از `case` مقدار شمارشی به بیت 0 یا 1 تبدیل می‌شود.

---

این روش باعث خوانایی بهتر و مستندسازی کد می‌شود و می‌توان بعداً راحت‌تر حالت‌های بیشتری اضافه کرد.

---

S -> 0S | 1A
A -> 1A | 0B
B -> 0S | 1C
C -> 0B | 1A | lambda

سؤال عالی‌ای پرسیدی!

---

## 💡 ماشین حالت (State Machine) چیست؟

**ماشین حالت** یا **Finite State Machine (FSM)** یکی از مهم‌ترین مفاهیم در طراحی دیجیتال، زبان VHDL و مدارهای منطقی است. FSM روشی برای **مدیریت رفتار یک سیستم بر اساس وضعیت فعلی و ورودی‌ها** است.

---

## 📦 تعریف ساده:

ماشین حالت یعنی سیستمی که:

- **در هر لحظه در یک حالت مشخص است** (مثل: `Idle`, `Loading`, `Error`, `Done`)
- **با توجه به ورودی‌ها، می‌تواند از یک حالت به حالت دیگر برود** (مثلاً اگر دکمه زده شد، از `Idle` به `Loading` برود)
- و **خروجی آن ممکن است وابسته به حالت فعلی یا حالت و ورودی باشد**

---

## 🧠 دو نوع FSM معروف:

| نوع FSM   | توضیح                                         |
| --------- | --------------------------------------------- |
| **Moore** | خروجی فقط به **وضعیت فعلی** بستگی دارد        |
| **Mealy** | خروجی به **وضعیت فعلی و ورودی‌ها** بستگی دارد |

---

## 📌 مثال واقعی ساده: دستگاه فروش نوشابه

حالات:

- `Idle` (در انتظار پول)
- `Half_Paid` (نصف پول وارد شده)
- `Paid` (پول کامل دریافت شده)
- `Dispense` (تحویل نوشابه)

ورودی‌ها:

- سکه وارد شده (`coin`)
- دکمه زده شده (`button`)

خروجی:

- `give_drink` (تحویل نوشابه)

---

## ✨ تعریف نوع enumerated برای FSM در VHDL

```vhdl
type state_type is (Idle, Half_Paid, Paid, Dispense);
signal current_state, next_state : state_type;
```

---

## ⛓️ ساختار کلی FSM در VHDL:

1. **فرآیند برای تغییر وضعیت (با کلاک):**

```vhdl
process(clk, reset)
begin
    if reset = '1' then
        current_state <= Idle;
    elsif rising_edge(clk) then
        current_state <= next_state;
    end if;
end process;
```

2. **فرآیند تعیین حالت بعدی (با توجه به ورودی و حالت فعلی):**

```vhdl
process(current_state, coin, button)
begin
    case current_state is
        when Idle =>
            if coin = '1' then
                next_state <= Half_Paid;
            else
                next_state <= Idle;
            end if;

        when Half_Paid =>
            if coin = '1' then
                next_state <= Paid;
            else
                next_state <= Half_Paid;
            end if;

        when Paid =>
            if button = '1' then
                next_state <= Dispense;
            else
                next_state <= Paid;
            end if;

        when Dispense =>
            next_state <= Idle;
    end case;
end process;
```

3. **تولید خروجی بر اساس نوع ماشین:**

- در **Moore**: خروجی فقط براساس `current_state`
- در **Mealy**: خروجی می‌تونه براساس `current_state` و ورودی‌ها باشه

---

## 📘 نتیجه‌گیری:

ماشین حالت یعنی برنامه‌نویسی رفتار یک سیستم **با وضعیت‌های مشخص**. در VHDL برای این کار معمولاً از نوع `enumerated` استفاده می‌کنیم چون واضح و خوانا هست.

---

اگر خواستی، یک ماشین حالت واقعی با کد VHDL برات پیاده می‌کنم (مثلاً چراغ راهنمایی یا قفل دیجیتال یا همین دستگاه نوشابه). بگو فقط چی دوست داری!

حتماً! در ادامه یک مثال کامل از **ماشین حالت نوع Moore** در VHDL می‌نویسم تا بهتر متوجه بشی.

---

## ✅ مثال: ماشین حالت **Moore** برای چراغ راهنمایی ساده

### 🎯 هدف:

چراغ راهنمایی با 3 حالت:

- `Red` → چراغ قرمز روشن
- `Green` → چراغ سبز روشن
- `Yellow` → چراغ زرد روشن

FSM به صورت چرخشی بین این حالات می‌گردد، و **خروجی فقط به وضعیت فعلی بستگی دارد** (این ویژگی اصلی Moore FSM است).

---

### 📘 تعریف Moore FSM در VHDL

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_light_moore is
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        red     : out std_logic;
        yellow  : out std_logic;
        green   : out std_logic
    );
end traffic_light_moore;

architecture rtl of traffic_light_moore is

    -- تعریف حالت‌ها
    type state_type is (Red_State, Green_State, Yellow_State);
    signal current_state, next_state : state_type;

begin

    -- رجیستر وضعیت با کلاک
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= Red_State;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- تعیین حالت بعدی
    process(current_state)
    begin
        case current_state is
            when Red_State    => next_state <= Green_State;
            when Green_State  => next_state <= Yellow_State;
            when Yellow_State => next_state <= Red_State;
        end case;
    end process;

    -- تولید خروجی بر اساس وضعیت فعلی (Moore)
    process(current_state)
    begin
        red    <= '0';
        yellow <= '0';
        green  <= '0';

        case current_state is
            when Red_State    => red    <= '1';
            when Green_State  => green  <= '1';
            when Yellow_State => yellow <= '1';
        end case;
    end process;

end rtl;
```

---

## ✳️ نکات:

- در Moore FSM خروجی فقط به `current_state` بستگی دارد، نه ورودی‌ها.
- برای سادگی، تایمر یا شمارنده زمان بین حالات حذف شده؛ ولی می‌تونه به راحتی اضافه بشه.

---

اگر خواستی همین چراغ راهنمایی رو با **Mealy FSM** هم برات بنویسم، یا نسخه‌ای که زمان مشخص برای هر رنگ داشته باشه (با شمارنده یا تایمر)، بگو برات می‌سازم.

همچنین اگه پروژه خاصی تو ذهنت هست و می‌خوای با FSM پیاده‌سازیش کنیم، در خدمتتم.

---

## !!! machine state SOAL EMTEHANI 100% !!!

- شکل رو هم میده


