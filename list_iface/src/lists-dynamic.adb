-- with Ada.Text_IO; use Ada.Text_IO;

package body Lists.dynamic is

    overriding
    function List_Constant_Reference (Container : aliased in List; Index : Index_Type) return Constant_Reference_Type is
        VCR : ACV.Constant_Reference_Type := ACV.Vector(Container).Constant_Reference(Index);
        CR : Constant_Reference_Type(VCR.Element);
    begin
--         Put_Line("List_Constant_Reference (LD, " & Index'Img & ");");
        return CR;
    end;
 
    overriding
    function List_Constant_Reference (Container : aliased in List; Position  : Cursor) return Constant_Reference_Type is
    begin
--         Put_Line("List_Constant_Reference (CLD, " & Position.Index'Img & ");");
        return List_Constant_Reference(Container, Position.Index);
    end;
 
    overriding
    function List_Reference (Container : aliased in out List; Index : Index_Type) return Reference_Type is
        VR : ACV.Reference_Type := ACV.Vector(Container).Reference(Index);
        R : Reference_Type(VR.Element);
    begin
--         Put_Line("List_Reference (LD, " & Index'Img & ");");
        return R;
    end;

    overriding
    function List_Reference (Container : aliased in out List; Position  : Cursor) return Reference_Type is
    begin
--         Put_Line("List_Reference (CLD, " & Position.Index'Img & ");");
        return List_Reference(Container, Position.Index);
    end;

    overriding
    function Iterate (Container : in List) return Iterator_Interface'Class is
        It : Iterator := (Container'Unrestricted_Access, Index_Base'First);
    begin
        return It;
    end;

    function Has_Element (L : List; Position : Index_Base) return Boolean is
        -- here we pass the check to the underlying Vector
    begin
        return ACV.Has_Element(L.To_Cursor(Position));
    end;



    overriding
    function First (Object : Iterator) return Cursor is
        C : Cursor := (Object.Container, Index_Type'First);
    begin
--         Put_Line("First (Iterator) = " & C.Index'Img & ";");
        return C;
    end;

    overriding 
    function Last  (Object : Iterator) return Cursor is
        C : Cursor := (Object.Container, List(Object.Container.all).Last_Index);
    begin
--         Put_Line("Last (Iterator) = " & C.Index'Img & ";");
        return C;
    end;

    overriding 
    function Next (Object   : Iterator; Position : Cursor) return Cursor is
        C : Cursor := (Object.Container, Position.Index + 1);
    begin
--         Put_Line("Next (Iterator) = " & C.Index'Img & ";");
        return C;
    end;

    overriding 
    function Previous (Object   : Iterator; Position : Cursor) return Cursor is
        C : Cursor := (Object.Container, Position.Index - 1);
    begin
--         Put_Line("Prev (Iterator) = " & C.Index'Img & ";");
        return C;
    end;
    
end Lists.dynamic;
