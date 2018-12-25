with Ada.Text_IO;

package body Lists.dynamic is

    overriding
    function List_Constant_Reference (Container : aliased in List; Index : in Index_Type) return Constant_Reference_Type is
        VCR : ACV.Constant_Reference_Type := ACV.Vector(Container).Constant_Reference(Index);
        CR : Constant_Reference_Type(VCR.Element);
    begin
        return CR;
    end;
 
    overriding
    function List_Reference (Container : aliased in out List; Index : in Index_Type) return Reference_Type is
        VR : ACV.Reference_Type := ACV.Vector(Container).Reference(Index);
        R : Reference_Type(VR.Element);
    begin
        return R;
    end;

--     overriding
--     function Element (Container : List; Index : Index_Type) return Element_Type is
--     begin
--         return ACV.Vector(Container).Element(Index);
--     end;
    
    overriding
    function Iterate (Container : in List) return List_Iterator_Interfaces.Reversible_Iterator'Class is
    begin
        return List_Iterator_Interfaces.Reversible_Iterator'Class(ACV.Vector(Container).Iterate);
    end;
    
end Lists.dynamic;
