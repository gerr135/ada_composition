with Ada.Text_IO; use Ada.Text_IO;

package generic_mixin is

    overriding
    procedure m1(Self : Derived) is
    begin
        Put_Line("gm:m1");
    end;

    overriding
    procedure m2(Self : Derived);
    begin
        Put_Line("gm:m2");
    end;

    overriding
    procedure m3(Self : Derived);
    begin
        Put_Line("gm:m3, calling m1&m2");
        Self.m1;
        Self.m2;
    end;

end generic_mixin;
