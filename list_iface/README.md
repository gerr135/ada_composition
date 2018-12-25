This gem creates an indexabe, iterabel interface, AKA list in many other languages, 
mirroring the essentials of Ada.Container.Vectors.
However, as an interface, it can be implemented in different ways, with two demos provided 
here. One maps directly onto A.C.Vectors and another uses a plain arrays (parametrized by 
discriminants, so it becomes fixed when declared, but required no memory management). 
The purpose here is to have a common interface and let the use swap the implementation as 
needed. Only declarations may need to be changed, but most of (e.g. the class-wide) code 
could stay the same..
