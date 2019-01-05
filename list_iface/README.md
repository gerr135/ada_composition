This gem creates an indexabe, iterabel interface, AKA list in many other languages, 
mirroring the essentials of Ada.Container.Vectors.
However, as an interface, it can be implemented in different ways, with two demos 
provided here. One maps directly onto A.C.Vectors and another uses a plain arrays 
(parametrized by discriminants, so it becomes fixed when declared, but required no memory 
management). The purpose here is to have a common interface and let the use swap the 
implementation as needed. Only declarations may need to be changed, but most of 
(e.g. the class-wide) code could stay the same..

NOTE: this version (branch) "hides" the actual data in dynamic version inside a record. 
This somewhat simplifies the logic, but does not allow to "glue" full Ada.Containers.Vectors 
on top of the List_Interface. Thus all the extra methods need to be declared and directed accordingly.
Basically bunch of wrapper code. Simple to comprehend, but more glue..
See the code in master branch for direct ovelay of the ACV.Vector over List_Interface.
The underlying iterator/indexing logic is the same, just the way methods are wrapped is different.
