# متغیرها برای تعریف نام فایل‌ها
DESIGN_FILE = $(wildcard *.vhd)
TESTBENCH_FILE = $(wildcard *_tb.vhd)
TESTBENCH_ENTITY = $(basename $(TESTBENCH_FILE))
VCD_FILE = $(TESTBENCH_ENTITY).vcd

# ابزارها
GHDL = ghdl
GTKWAVE = gtkwave

# پرچم‌ها
GHDL_FLAGS = --std=08
SIM_FLAGS = --vcd=$(VCD_FILE)

# هدف پیش‌فرض
all: analyze elaborate simulate view

# تحلیل فایل‌ها
analyze:
	$(GHDL) -a $(GHDL_FLAGS) $(DESIGN_FILE) $(TESTBENCH_FILE)

# ایجاد فایل اجرایی
elaborate:
	$(GHDL) -e $(GHDL_FLAGS) $(TESTBENCH_ENTITY)

# اجرای شبیه‌سازی
simulate:
	$(GHDL) -r $(GHDL_FLAGS) $(TESTBENCH_ENTITY) $(SIM_FLAGS)

# نمایش نتایج در GTKWave
view:
	$(GTKWAVE) $(VCD_FILE) &

# پاک‌سازی فایل‌های موقت
clean:
	rm -f *.o *.cf $(VCD_FILE)

.PHONY: all analyze elaborate simulate view clean