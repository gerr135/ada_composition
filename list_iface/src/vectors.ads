--
--  A barebones indexed interface which can be iterated over.
-- Child packages will either pass through to core (fixed) array or a Vector;
-- 
-- The idea is to create an interface that will allow multiple implementations but can be 
-- used directly in implementing common (class-wide) functionality.
--
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

with Ada.Iterator_Interfaces;

generic
    type Index_Base is range <>; -- pass an "extended" indes_base (e.g. starting from 0 and counting from 1)
    type Element_Type is private;
package vectors is

    subtype Index_Type is Index_Base range Index_Base'First + 1 .. Index_Base'Last;
    -- mirrors the common subtype definition. Should be the same as defined likewise anywhere else..
    
    type List_Interface is interface
        with Constant_Indexing => List_Constant_Reference,
            Variable_Indexing => List_Reference,
            Default_Iterator  => Iterate,
            Iterator_Element  => Element_Type;

    type Cursor is private;
    No_Element : constant Cursor;

    function Has_Element (Position : Cursor) return Boolean;
    package List_Iterator_Interfaces is new Ada.Iterator_Interfaces (Cursor, Has_Element);

    type Constant_Reference_Type (Data : not null access constant Element_Type) is private
        with Implicit_Dereference => Data;
    type Reference_Type (Data : not null access Element_Type) is private
        with Implicit_Dereference => Data;
    function List_Constant_Reference (Container : aliased in List_Interface; Index : in Index_Type) return Constant_Reference_Type is abstract;
    function List_Reference (Container : aliased in out List_Interface; Index : in Index_Type) return Reference_Type is abstract;

    function Iterate (Container : List_Interface) return List_Iterator_Interfaces.Reversible_Iterator'Class is abstract;

private

    type List_Access is access all List_Interface'Class;
    for List_Access'Storage_Size use 0;

    type Cursor is record
        Container : List_Access;
        Index     : Index_Base := Index_Type'First;
    end record;

    No_Element : constant Cursor := (Null, Index_Base'First);

    type Constant_Reference_Type(Data : not null access constant Element_Type) is null record;
--         Control : Reference_Control_Type :=
--             raise Program_Error with "uninitialized reference";
--             --  The RM says, "The default initialization of an object of
--             --  type Constant_Reference_Type or Reference_Type propagates
--             --  Program_Error."
--     end record;

    type Reference_Type (Data : not null access Element_Type) is null record;
--         Control : Reference_Control_Type :=
--             raise Program_Error with "uninitialized reference";
--             --  The RM says, "The default initialization of an object of
--             --  type Constant_Reference_Type or Reference_Type propagates
--             --  Program_Error."
--     end record;


end vectors;
