with Ada.Text_IO; use Ada.Text_IO;

package body generic_mixin is

    overriding
    procedure bare(Self : Derived) is
    begin
        Put_Line("      gm:bare");
    end;

    overriding
    procedure compound(Self : Derived) is
    begin
        Put_Line("      gm:compound, calling bare");
        Self.bare;
    end;

end generic_mixin;
