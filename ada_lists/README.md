# Elaborate List interface demo
A demo of iterable and indexabe container hierarchy operating on type tree.

## About
This is an extension of the list_iface demo, providing a similar indexable/iterabel container 
type hierarchy (rooted in an interface), but designed to store not a single type passed as 
a single generic in previous simple example. This variant of container composition allows 
to store another hierarchy of tagged types.


## Technicalities
The bulk of container code is the same as in list_iface demo. Only few changes were made, 
mostly in the definition of generics. The "private" has been replaced with an "interface", 
with the idea that an abstract top-level lists package is instantiated with an interface
that parallels the root type of our stored type hierarchy. Then specific implementations of
container package are instantiated with specific derived types as needed.  Normally, it 
should be possible to mix and match - say to use fixed container to store vector-based types,
or dynamic container to store some other root child. However, at the moment, it seems that 
the compiler is picky with some combinations. In particular, trying to use data type that 
is directly derived from ACV.Vector with any container seems to produce weird behavior 
(run-time STORAGE_ERROR sensitive to white-space - likely triggering some bug in gnat). 
And trying to combine ACV.Vectropr based data with alike container does not even compiler 
(while following the same method layout and derivation).

The code layout follows the type inheritance tree:
(this is a carry-over from list_iface for quick reference)
- lists     
  contains interface at the root of type hierarchy. 
  This module provides common interface containing essential primitives to be used in universal, 
  data-layout independent way.

- lists.fixed     
  an array-based implementation. Data is stored in a plain Ada array, parametrized by type discriminant. 
  Storage size is fixed at declaration, but no further allocation is needed (or can be done), 
  just like with regular arrays.

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
   (via basic, inlined call redirection) but all ACV.Vector methods become available.


## Dependencies
None. Only core Ada features (plus Ada.Containers.Vectors) are used.


