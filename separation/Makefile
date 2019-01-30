SOURCES = src/*.ad?

# rule to link the program
separation: $(SOURCES)
	gprbuild -P separation.gpr

clean:
	rm -f obj/{dbg,release}/*

.PHONEY: clean
