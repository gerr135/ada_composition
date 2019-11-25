TARGET = test_list_iface test_list_combo
SOURCES = src/*.ad?
BUGS = src/bug01.adb

# rule to link the program
all: $(SOURCES)
	gprbuild -P ada_lists_tests.gpr

bug01: $(BUGS)
	gprbuild -P bug01.gpr

clean:
	rm obj/*/* test_*

.PHONEY: clean
