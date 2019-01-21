# Type mixins
A demo of mixing in functionality of parallel type hierarchies.

## About
This is a demo of how to mix independent type hierarchies using interfaces (introduced
in Ada-2005). This demo presents multiple ways to do such composition: using generics
and a more common interface/type composition (reminiscent of Java).

## Technicalities
Ada does not have "full" multiple inheritance, meaning (tagged) types can only have a single
type as a progenitor. However they can inherit multiple interfaces. This somewhat resembles
the situation in Java, with an important difference, that interfaces can only have abstract
or null primitives. Actual code can only be in class-wide methods. Thus classic/strict
derivation is not as straightforward.

This demo shows multiple way to compose a complex type inheriting functionality of multiple
progenitors. In addition to a more "classical" type derivation, generics can be used to
somewhat "automate" the process, decreasing the amount of glue code. However this comes with
its own trade-of of significantly complexifying (and prolonging) the compilation. After all,
the intended purpose of generics is to have parametrized packages, not to act as a substitute
for OOP system. But the combination of OOP and generics allows certain compositions not
possible otherwise.

## Dependencies
None. This only uses core language.
