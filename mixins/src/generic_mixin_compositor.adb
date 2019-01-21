with Ada.Text_IO; use Ada.Text_IO;

package body generic_mixin_compositor is

    overriding
    procedure simple       (Self : Mixin_Child) is
    begin
        Put_Line("      MC:simple");
    end;

--     overriding
--     procedure compound     (Self : Mixin_Child) is
--     begin
--         Put_Line("      MC:compound,  calling MC.simple");
--     end;

end generic_mixin_compositor;
