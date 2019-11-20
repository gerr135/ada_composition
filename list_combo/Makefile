SOURCES = src/*.ad?

# rule to link the program
list_iface: $(SOURCES)
	gprbuild -P list_combo.gpr

clean:
	rm obj/*/*  test_list_combo

.PHONEY: clean
