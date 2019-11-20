TARGET = test_list_iface test_list_combo
SOURCES = src/*.ad?

# rule to link the program
list_iface: $(SOURCES)
	gprbuild -P ada_lists_tests.gpr

clean:
	rm obj/*/* test_*

.PHONEY: clean
