with Ada.Text_IO; use Ada.Text_IO;

package body base_type is

    procedure method(Self : The_Type) is
    begin
        Put_Line("      bt:method");
    end;

end base_type;
