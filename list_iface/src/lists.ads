--
-- A barebones indexed interface which can be iterated over.
-- Child packages will either pass through to core (fixed) array or a Vector;
-- 
-- The idea is to create an interface that will allow multiple implementations but can be 
-- used directly in implementing common (class-wide) functionality.
--
-- Copyright (C) 2018  <copyright holder> <email>
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with Ada.Iterator_Interfaces;

generic
    type Index_Base is range <>; -- pass an "extended" indes_base (e.g. starting from 0 and counting from 1)
    type Element_Type is private;
package Lists is

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
        
    function List_Constant_Reference (Container : aliased in List_Interface; Position  : Cursor) return Constant_Reference_Type is abstract;
    function List_Constant_Reference (Container : aliased in List_Interface; Index : Index_Type) return Constant_Reference_Type is abstract;

    function List_Reference (Container : aliased in out List_Interface; Position  : Cursor) return Reference_Type is abstract;
    function List_Reference (Container : aliased in out List_Interface; Index : Index_Type) return Reference_Type is abstract;
    -- these names have to be different from what is used (in private part) by Ada.Containers.Vectors
    -- if we are to directly glue ACV.Vector over this,
    -- otherwise the compiler gets confused..

    ----------------------------------------------
    -- Iteration
    --
    -- we need to define our iterator type in a central way.
    -- Since implementation details may differe, we essentially get a parallel type hierarchy here..
    
    type Iterator_Interface is interface and List_Iterator_Interfaces.Reversible_Iterator;
    -- all 4 primitives (First, Last, Next, Prev) would be abstract here anyway, 
    -- so they are implicitly carried over


    function Iterate (Container : List_Interface) return Iterator_Interface'Class is abstract;
    -- this one can (and should) share the name/specs, as it is not part of any aspect..

private

    type List_Access is access all List_Interface'Class;
    for List_Access'Storage_Size use 0;

    type Cursor is record
        Container : List_Access;
        Index     : Index_Base := Index_Type'First;
    end record;

    No_Element : constant Cursor := (Null, Index_Base'First);

    type Constant_Reference_Type(Data : not null access constant Element_Type) is null record;

    type Reference_Type (Data : not null access Element_Type) is null record;

--     type Iterator_Interface is abstract new List_Iterator_Interfaces.Reversible_Iterator with null record;
    -- all 4 primitives (First, Last, Next, Prev) would be abstract here anyway, 
    -- so they are implicitly carried over
    
end Lists;
