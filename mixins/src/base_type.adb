with Ada.Text_IO; use Ada.Text_IO;

package base_type is

    procedure bt_method(Self : The_Type) is
    begin
        Put_Line("bt:bt_method");
    end;

end base_type;
