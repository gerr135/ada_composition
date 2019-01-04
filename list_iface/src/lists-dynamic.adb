with Ada.Text_IO; use Ada.Text_IO;

package body Lists.dynamic is

    overriding
    function List_Constant_Reference (Container : aliased in List; Index : Index_Type) return Constant_Reference_Type is
        CVR : ACV.Constant_Reference_Type := Container.vec.Constant_Reference(Index);
        R : Constant_Reference_Type(CVR.Element);
    begin
        Put_Line("List_Constant_Reference (LD, " & Index'Img & ");");
        return R;
    end;
 
    overriding
    function List_Constant_Reference (Container : aliased in List; Position  : Cursor) return Constant_Reference_Type is
    begin
        Put_Line("List_Constant_Reference (CLD, " & Position.Index'Img & ");");
        return List_Constant_Reference(Container, Position.Index);
    end;
 
    overriding
    function List_Reference (Container : aliased in out List; Index : Index_Type) return Reference_Type is
        VR : ACV.Reference_Type := Container.vec.Reference(Index);
        R : Reference_Type(VR.Element);
    begin
        Put_Line("List_Reference (LD, " & Index'Img & ");");
        return R;
    end;

    overriding
    function List_Reference (Container : aliased in out List; Position  : Cursor) return Reference_Type is
    begin
        Put_Line("List_Reference (CLD, " & Position.Index'Img & ");");
        return List_Reference(Container, Position.Index);
    end;

    overriding
    function Iterate (Container : in List) return List_Iterator_Interfaces.Reversible_Iterator'Class is
    begin
        Put_Line("Iterate (LD)");
--         return List_Iterator_Interfaces.Reversible_Iterator'Class(Container.vec.Iterate);
        return Container.vec.Iterate;
    end;

    function To_Vector (Length : Index_Type) return List is
        L : List := (vec => ACV.To_Vector(Ada.Containers.Count_Type(Length)));
    begin
        return L;
    end;

    
end Lists.dynamic;
