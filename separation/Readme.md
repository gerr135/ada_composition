# Algorythm and data storage separation

## About
Some/often-times the general algorythm or some aspects of the project
can be implemented in some invariant way. In general, the logic of data manipulation is
independent of specifics of data storage, given that data acces PI is well defined and stable.
In fact, it often makes sense to develop the algorythmic part of the code without regard for
the miniscule details of data layout. This prevents the desire to succumb to premature
optimizations locking in the code to some minor and unimportant specifics that, down the road,
can prevent refactoring or changing some more important aspect or use swapping one approach
for another. It is in general a good programming practice, especially in big projects.
This demo shows how the algorythmic part can be decoupled from the data storage in a systematic way.

## Technicalities
This demo uses interface hierarchy to store algorithms and specific types derived from them
to provide data storage and access. In the most trivial case we can simply have an interface
with class-wide methods implementing the algorithms and a few derived types hodling the data.
However the more interesting cases would have multiple interfaces providing various data
processing detail depending on the abstraction. E.g. a simple "top level"  interface can
notionally deal with simle collections of entries, cycling through them one by one,
while an "optimized interface" would build matrices and do some linear algebra, possibly
invoking Blast or related optimized libraries. Tying this algorithmic hierarchy of interfaces
to a largely independent tree or hierarchy of data storage types may be not completely trivial
without code duplication. This demo tries to provide simple enough examples of non-trivial
use of such constructs.

On the demo specifics: it would be interesting indeed to use some convoluted calculation
as an example, that would reguire e.g. linear algebra and could be implemented either
as naive loops over original data or would use an optimized library that would require constructing
additional data to pass around. HOwever that would complicate the comprehensibility of the code.
After all the major point of these demos is data abstraction and type composition.
So, instead, we will do some trivial manipulation that does not really require optimization.
But we will mimick the more complex situation nonetheless by requiring derived optimized
algorithmic interface to have access to additional data.


## Dependencies
None. Only core Ada features (plus Ada.Containers.Vectors) are used.

## Notes
