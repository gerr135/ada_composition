with Ada.Text_IO; use Ada.Text_IO;

package body base_iface is

    procedure class_wide(Self : The_Interface'Class) is
    begin
        Put_Line("      iface'Class:class-wide, calling Self.simple");
        Self.simple;
    end;

end base_iface;
