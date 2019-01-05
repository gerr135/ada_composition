This gem creates an indexabe, iterabel interface, AKA list in many other languages, 
mirroring the essentials of Ada.Container.Vectors (referenced as ACV below).
However, as an interface, it can be implemented in different ways, with two demos 
provided here. One maps directly onto A.C.Vectors and another uses plain arrays 
(parametrized by discriminants, so it becomes fixed when declared, but requires no memory 
management). The purpose here is to have a common interface and let the use swap the 
implementation as needed. Only declarations may need to be changed, but most of 
(e.g. the class-wide) code could stay the same..

This is somewhat based on the Ada gems article on iterators, but is very heavily modified/diverged
from that. Initial attempts at direct mapping would confuse the comiler or even cause gnat to crash.
Successful implementation requires in fact much more glue and extra code - two parallel 
type hierarchies (the container itself and Iterator) plus some compound records to tie it all together.
The end result though does successfully glue ACV.Vector on top of the 
List_Interface. Note how To_Vector constructor is not declared in lists.dynamic at all,
but is taken straight from Ada.Containers.Vectors..

The (very similar) code in the "in_rec"" branch demoes an alternative approach:
ACV.Vector is made a record component, not direct overlay. This is much simpler to comprehend, 
but requires declaring and implementing (basic wrapping) all additional ACV.Vector 
methods explicitly.

