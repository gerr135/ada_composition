pragma Ada_2012;

with Ada.Text_IO; use Ada.Text_IO;

package body Base is

    procedure caller (BC : Base_Interface'Class) is
    begin
        Put_Line("BC.caller,  calling print");
        BC.print; -- should dispatch here
    end caller;

    overriding procedure print (BF : Base_Fixed) is
    begin
        Put("  fixed.print,  elements = [");
        for i in 1 .. BF.N - 1 loop
            Put(BF.elements(i)'Img & ", ");
        end loop;
        Put_Line(BF.elements(BF.N)'Img & "];");
    end print;


    function "=" (Left, Right : Base_Fixed) return Boolean is
    begin
        if Left.N /= Right.N then
            return False;
        else
            for i in 1 .. Left.N loop
                if Left.elements(i) /= Right.elements(i) then
                    return False;
                end if;
            end loop;
        end if;
        return True;
    end "=";


    function set_idx (e : Index) return Base_Fixed5 is
    begin
        return BF : Base_Fixed5 do
            for i in Index range 1 .. 5 loop
                BF.elements(i) := Element_Type(e);
            end loop;
        end return;
    end set_idx;

end Base;
