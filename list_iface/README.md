# List interface
A demo of iterable and indexabe interface that can be overlayed by an existing container type

## About
This is a demo of how to create an indexabe, iterabel interface, AKA list in many other languages, 
mirroring the essentials of Ada.Container.Vectors (referenced as ACV below).
The interface can be implemented in different ways, with three demos 
provided here. One maps directly onto Ada.Containers.Vectors.Vector (ACV.Vector), 
another contains ACV.Vector as a record field and last one uses plain array
(parametrized by discriminants, so it becomes fixed when declared, but requires no memory 
management). The purpose here is to have a common interface and let the user swap the 
implementation as needed. Only declarations may need to be changed, but most of 
(e.g. the class-wide) code could stay the same..

## Technicalities
This is based on the Ada gems articles on iterators, <a href="https://www.adacore.com/gems/gem-127-iterators-in-ada-2012-part-1">#127</a>
and <a href="https://www.adacore.com/gems/gem-128-iterators-in-ada-2012-part-2">#128</a> by AdaCore.
However this is significantly expanded. First, this demo provides not oonly iteration 
but also indexing, thus a complete code of A.C.Vectors. Then, and even more essentially,
the presented interface serves as a root of type hierarchy, with specific implementations 
being a proper types descendant from it. And finally, one of the implementations overlays
an existing container type (ACV.Vector) directly over the interface, thus providing a direct
access to ACV.Vector methods - they "magically appear" directly callable, etc; and without 
using any extra data fields.

Creating such functional type hierarchy pretty much required reimplementing a lot of
Ada.Containers internals. This includes creating a parallel type hierarchy for Iterator type.
In the given example all Iterator functionality could be stored in a single type, perhaps 
with 1 method overridden. However the whole hierarchy is provided here in order to have
an easily tunable pattern.

The code layout follows the type inheritance tree:
- lists
     contains interface at the root of type hierarchy. This module provides common interface containing essential primitives to be used in universal, data-layout independent way.

- lists.fixed     
     an array-based implementation. Data is stored in a plain Ada array, parametrized by type discriminant. Storage size is fixed at declaration, but no further allocation is needed (or can be done), just like with regular arrays.

- lists.dynamic   
ACV.Vector as a record entry implementation.
Data is stored in ACV.Vector as record entry. Can grow and shrink, etc. 
This is a classical composition layout. Simple to understand and write 
glue code for methods, but all methods should be explicitly implemented.

- lists.vectors   
                  ACV.Vector overlaid right over the interface.
                  This composition requires more care to properly connect the pieces, but
                  makes ACV.Vector methods "magically appear" directly callable, with minimum
                  of glue code. Only explicitly declared methods need to be implemented,
                  (via basic, inlined call redirection)
                  but all ACV.Vector methods become available.


## Dependencies
None. Only core Ada features (plus Ada.Containers.Vectors) are used.

## Notes
One technical nmote: while experimenting with ways to overlay existing type on top of an interface
and make functional class-wide redispatch during the "of loop" and indexing (which is 
indirect and relies on a lot of aspects and code unfolding) I managed to trigger a bug in compiler.
The code that triggers the bug is in a separate branch: gnat_bug


