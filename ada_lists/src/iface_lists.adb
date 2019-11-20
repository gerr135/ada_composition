-- with Ada.Text_IO; use Ada.Text_IO;

package body Iface_Lists is

    function Has_Element (Position : Cursor) return Boolean is
        -- Ada's stock ACV checks for Position = No_Element here, 
        -- which requires much more bookkeeping, possibly type specific.
        -- Here we deal with type hierarchy, with possibly different iteration implementation deltails
        -- for each derived type. It makes way more sense to let the container handle this itself.
        -- So we just redispatch here..
    begin
--         Put("Cursor.Has_Element (" & Position.Index'Img & ");   ");
        return Position.Container.Has_Element(Position.Index);
    end Has_Element;
    
end Iface_Lists;
