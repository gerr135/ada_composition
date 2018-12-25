with Ada.Text_IO;

package body Lists is

    Todo : exception;


    function Has_Element (Position : Cursor) return Boolean is
    begin
        return Position /= No_Element;
    end Has_Element;
    
end Lists;
