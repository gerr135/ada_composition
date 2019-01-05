This gem creates an indexabe, iterabel interface, AKA list in many other languages, 
mirroring the essentials of Ada.Container.Vectors.
However, as an interface, it can be implemented in different ways, with two demos 
provided here. One maps directly onto A.C.Vectors and another uses a plain arrays 
(parametrized by discriminants, so it becomes fixed when declared, but required no memory 
management). The purpose here is to have a common interface and let the use swap the 
implementation as needed. Only declarations may need to be changed, but most of 
(e.g. the class-wide) code could stay the same..

NOTE on active version: I have added a test for for loop over class-wide variable which 
confuses the compiler. If the last block of code is commented/removedf, leaving only the 
specific types declarations, then this code builds and works fine, as before.

NOTE 2: the confusion was coming from only one vfariant of Rerference and Constant_Reference 
being implemented. Adding both fixed the compilation, but now the same loop throws 
CONSTRAINT_ERROR : Ada.Tags.Displace: invalid interface conversion
at runtime. The confusion was merely pushed to RTL apparently.
The fix should come from some refactoring: instead of trying to literally glue 
Ada.Containers.Vectors right ofer the List_Interface, the Dynami.List should be a record
with a single field : ACV.Vector;
This should prevent confusion by gnat, but all extra methods should be explicitly declared.
They will not magically carry over from ACV.Vector..

NOTE 3: implemented the change described in Note 2 - making Vector in Dynamic.List a record entry
rather than gluing Vector on top if List_Interface. Complies fine too, but oddly raises the same
exception and not just at the end, but when looping over specific (dynamic) type too now..

It is possible that Iterator type conversion (from ACV.Vector's iterator to our class)
is the core issue here. As Iterator is already implemented for fixed, and it is rather trivial,
only incrementing/decrementing the Cursor index position, and all variants provide direct 
indexed access, - it may make sense to implement the iterator centrally (in lists.ad?) as 
complete type, rather than interface. Specific implementations then would only provide indexed access.
This might make that original approach (gluing Vector over List_Interface) work too.



NOTE on gnat bug:
The specific conversion was not intended to be used seriously. I just wanted to test how 
compiler would complain if I attempt it (since I was at this point in the code nyway).
But it is supposed to handle this gracely anyway, so this source tag (which I'll save in 
a separate branch) contains all the relevant code as it was at the point of failure.


The text of the bug (spit out by gnat) is in the bug_info.txt file
(Readme.md tries to collite the lines and misformats the message)
