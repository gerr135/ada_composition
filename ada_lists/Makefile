SOURCES = src/*.ad?

# rule to link the program
list_iface: $(SOURCES)
	gprbuild -P ada_lists.gpr

clean:
	rm -f obj/* lib/*

.PHONEY: clean
