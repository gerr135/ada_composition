--
-- <one line to give the library's name and an idea of what it does.>
-- Copyright (C) 2018  <copyright holder> <email>
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

with Ada.Text_IO;

package body vectors.dynamic is

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
    
end vectors.dynamic;
