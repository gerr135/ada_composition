with Ada.Text_IO; use Ada.Text_IO;

package body generic_mixin is

    overriding
    procedure simple(Self : Derived) is
    begin
        Put_Line("      gm:simple");
    end;

    overriding
    procedure compound(Self : Derived) is
    begin
        Put_Line("      gm:compound, calling Derived.simple");
        Self.simple;
    end;

    overriding
    procedure redispatching(Self : Derived) is
    begin
        Put_Line("      gm:compound, calling Derived'Class.simple");
        Derived'Class(Self).simple;
    end;

end generic_mixin;
