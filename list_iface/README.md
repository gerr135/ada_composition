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
