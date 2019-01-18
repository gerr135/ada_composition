with Ada.Text_IO; use Ada.Text_IO;

procedure Hello is

    package Some_Interface is

        type The_Interface is limited interface;
        function f1(Self : The_Interface) return Integer is abstract;
        function f2(Self : The_Interface) return Integer is abstract;
        function f3(Self : The_Interface) return Integer is abstract;

        generic
            type Base is tagged limited private;
        package Mixin is
            type Derived is new Base and The_Interface with null record;
            overriding function f1(Self : Derived) return Integer;
            overriding function f2(Self : Derived) return Integer;
            overriding function f3(Self : Derived) return Integer;
        end Mixin;

    end Some_Interface;

    package body Some_Interface is
        package body Mixin is
            function f1(Self : Derived) return Integer is
            begin
                return 10;
            end f1;
            function f2(Self : Derived) return Integer is
            begin
                return 20;
            end f2;
            function f3(Self : Derived) return Integer is
            begin
                return Self.f1 + Self.f2;
            end f3;
        end Mixin;
    end Some_Interface;

    -- For examples using existing inheritance trees we need
    -- a base type
    type Third_Party_Base is tagged null record;

    package Examples is

        use Some_Interface;

        type Example_1 is limited new The_Interface with private;

        type Example_2 is new Third_Party_Base and The_Interface with private;

    private

        -----------------------------------------------
        -- Packages
        -----------------------------------------------

        -- For situations where you have no regular base class,
        -- this is needed for the Mixin contract
        type Secret_Base is tagged limited null record;
        package Example_1_Pkg is new Mixin(Base => Secret_Base);

        -- For situations where you already have a base class, the
        -- instantiation is simpler.
        package Example_2_Pkg is new Mixin(Base => Third_Party_Base);

        -- ****NOTE:  You can chain multiple mixins to get defaults for
        --            various interfaces.  For Example:
        --               package A_Pkg is new A_Mixin(Base => Some_Base);
        --               package B_Pkg is new B_Mixin(Base => A_Pkg.Derived);
        --            This will add both interfaces from A_Mixin and B_Mixin
        --            to the base type.

        -----------------------------------------------
        -- Full Type Declarations
        -----------------------------------------------

        type Example_1 is limited new Example_1_Pkg.Derived with null record;

        type Example_2 is new Example_2_Pkg.Derived with null record;

    end Examples;

begin
    Put_Line("Hello, world!");
end Hello;

-- *******************************************
--
-- However, note that the defaults follow the basic Ada rules.  They don't
-- redispatch unless you specify that (For example in f3 you would do things
-- like The_Interface'Class(Self).f1 and so on).  So you have to decide what
-- you want those defaults really do.  Redispatch is fairly dangerous to do
-- in Ada since it is not the default for inherited programs.  I would
-- caution against it unless you have a real need and know what you are doing.


-- And if you don't like the Mixin method, you can do something a bit closer to
-- composition and Rust's model (though Ada doesn't support traits, so
-- it has to be emulated by inheriting an interface instead):
--
-- *******************************************

with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is

    package Some_Interface is

        type The_Interface is limited interface;
        function f1(Self : The_Interface) return Integer is abstract;
        function f2(Self : The_Interface) return Integer is abstract;
        function f3(Self : The_Interface) return Integer is abstract;

        type The_Default is new The_Interface with null record;
        overriding function f1(Self : The_Default) return Integer;
        overriding function f2(Self : The_Default) return Integer;
        overriding function f3(Self : The_Default) return Integer;

    end Some_Interface;

    package body Some_Interface is

        function f1(Self : The_Default) return Integer is
        begin
            return 10;
        end f1;
        function f2(Self : The_Default) return Integer is
        begin
            return 20;
        end f2;
        function f3(Self : The_Default) return Integer is
        begin
            return Self.f1 + Self.f2;
        end f3;

    end Some_Interface;

    -- For examples using existing inheritance trees we need
    -- a base type
    type Third_Party_Base is tagged null record;

    package Examples is

        use Some_Interface;

        type Example_1 is limited new The_Interface with private;
        overriding function f1(Self : Example_1) return Integer;
        overriding function f2(Self : Example_1) return Integer;
        overriding function f3(Self : Example_1) return Integer;

        type Example_2 is new Third_Party_Base and The_Interface with private;
        overriding function f1(Self : Example_2) return Integer;
        overriding function f2(Self : Example_2) return Integer;
        overriding function f3(Self : Example_2) return Integer;

    private

        -----------------------------------------------
        -- Full Type Declarations
        -----------------------------------------------

        type Example_1 is limited new The_Interface with record
            The_Interface_Impl : The_Default;
        end record;

        type Example_2 is new Third_Party_Base and The_Interface with record
            The_Interface_Impl : The_Default;
        end record;

    end Examples;

    package body Examples is
        function f1(Self : Example_1) return Integer is (Self.The_Interface_Impl.f1);
        function f2(Self : Example_1) return Integer is (Self.The_Interface_Impl.f2);
        function f3(Self : Example_1) return Integer is (Self.The_Interface_Impl.f3);

        function f1(Self : Example_2) return Integer is (Self.The_Interface_Impl.f1);
        function f2(Self : Example_2) return Integer is (Self.The_Interface_Impl.f2);
        function f3(Self : Example_2) return Integer is (Self.The_Interface_Impl.f3);
    end Examples;

begin
    Put_Line("Hello, world!");
end Hello;

-- *******************************************
--
-- This requires more footwork, but enforces that all
-- implementors of the interface have to specify a body for all
-- inherited abstract operations.



generic
    type Base is interface ...;
package Poor_Mans_Inheritance;
    type Instance is new Base with ...;
    overriding procedure Inherit_Me_Please (X : in out Instance);
end Poor_Mans_Inheritance;

type My_Type_I_Cannot_Use_Yet is new Base with ...;
package Generic_Mess is new Poor_Mans_Inheritance (My_Type_I_Cannot_Use_Yet);
type My_Type is new Generic_Mess.Instance with null record;
