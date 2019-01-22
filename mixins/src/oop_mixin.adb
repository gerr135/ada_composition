with Ada.Text_IO; use Ada.Text_IO;

package body oop_mixin is

    overriding
    procedure simple(Self : Derived) is
    begin
        Put_Line("      mn:simple");
    end;

    overriding
    procedure compound(Self : Derived) is
    begin
        Put_Line("      mn:compound, calling Derived.simple");
        Self.simple;
    end;

    overriding
    procedure redispatching(Self : Derived) is
    begin
        Put_Line("      mn:compound, calling Derived'Class.simple");
        Derived'Class(Self).simple;
    end;

end oop_mixin;
