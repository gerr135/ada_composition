# ada_composition
Ada type composition demos

## About
This is a collection of code examples demonstrating how to do some non-trivial type composition in Ada language. Ada is a stricktly typed language (for real, not in the sense of merely **having types** as many other languages claming to be strongly typed too). Correspondingly, Ada has a very rich type system, allowing buidling complex OOP hierarchies, intermixed with generics and some Ada-specific stuff. This project holds a collection of (reasonably) small code examples demonstrating less common or not entirely trivial ways to ties types toghether. This started by trying to add iteration and indexing to an existing type and providing the possibility to overlay Ada.Containers.Vectors.Vector over the existing type. The cleanest way to test the composition was to quickly whip up some small testing code, which exposed some issues and grew bigger than intended. As the resulting code presents the situation that can be usefull in some common cases, this depositary was created to keep this and other similar examples.

Each individual demo is in its own directory with a corresponding Readme providing a specific description.

## Licensing
All the code here is under non-restrictive license (basically AS-IS clause with copyright. For the moment this is BSD licence, but this can be changed if some other better license is suggested). It is intended to be copied and modified by anybody if there is any need.
