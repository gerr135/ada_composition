# Type mixins
A demo of mixing parallel type hierarchies.

# About
This is a demo of how to mix independent type hierarchies using interfaces (introduced
in Ada-2005). This demo presents multiple ways to do such composition: using generics
and a more common interface/type composition (reminiscent of Java).

# Technicalities
Ada does not have a "full" multiple inheritance, meaning (tagged) types can only have a single
type as a progenitor. However they can inherit multiple interfaces. This somewhat resembles
the situation in Java, with an important difference, that interfaces can only have abstract
or null primitives. Actual code can only be in class-wide methods. Thus derivation is not 
as straightforward. This demo shows multiple ways to compose a complex type inheriting 
functionality of multiple progenitors.

1. 
First method shown is more akin "classic OOP" with one type serving as a specific ancestor 
and another one attached via encapsulation of its data into a record as an extra entry and
adding glue code to reroute appropriate calls. **NOTE: only the primitives of the __"proper"__
(that is direct) ancestor can be properly overridden.** Redispatching is tag-based and there 
is essentially one "main line of tag inheritance that is taken into account; that of the 
"proper ancestor". The encapsulated "extra" data is not counted for inheritance, as tag 
belongs to the recrod itself. This can be overcome by using the class-wide methods starting 
at the interface level. Passing a class-wide parameter preserves the tag ans allows 
proper dispatching, as illsutrated in the code (see the class-wide method).

2. 
Another method is to make use of generics - to pass a mixed-in type as a generic parameter. 
This allows to have proper inheritance even on the mixed-in type, with redispatching (casting 
to class-wide) methods calling a proper inherited primitive. Additionally generics can help 
to somewhat "automate" the process, decreasing the amount of glue code. 
However this comes with its own trade-of of significantly complexifying (and prolonging) 
the work for the compiler. Not a major concern in itself normally - in small projects. 
However as project size grows, compilation times can grow quicly, sometimes  measuring in days 
or even weeks.. After all, the intended purpose of generics is to have parametrized packages, 
not to act as a substitute for OOP system. (And if the use of generics is limited to their 
intended purpose, they mostly stay manageble and very useful tool). But then, the combination 
of OOP and generics allows certain compositions not possible otherwise.

In both cases in order to glue two type hierarchies together, 1st one needs to decide which 
type hierarchy should serve as the central "trunk", following regular inheritance. Then, 
an interface needs to be created representing the call/primitives signature of the 2nd type hierarchy.
This interface can then be added to the central type and the actual type data/code can be either
adde-on or passed via generic.

These limitations (no proper inheritance in the 2nd type or having to use generics) could
be overcome by allowing methods of Ada interfaces to be non-abstract or null and to contain 
actual code referencing other methods (and eventually operating with abstract/null primitives
in place of actual data access) and be overridden (right now only class-wide methods of 
interfaces can contain code). However the word of people close to gnat development circles 
has been that they could not find the way to do so safely.

## Dependencies
None. This only uses core language.
