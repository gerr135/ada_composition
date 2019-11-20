--
-- This is a "fixed" implementation, as a straight (discriminated) array, no memory management.
--
-- Copyright (C) 2018 George Shapovalov <gshapovalov@gmail.com>
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

generic
package Lists.fixed is

    type List(Last : Index_Base) is new List_Interface with private;
    -- Last - last index of array, e.g. 1..2 - last:=2; 4..9 - last:=9;
    -- first index is Index_Type'First

    overriding
    function List_Constant_Reference (Container : aliased in List; Position  : Cursor) return Constant_Reference_Type;

    overriding
    function List_Constant_Reference (Container : aliased in List; Index : Index_Type) return Constant_Reference_Type;

    overriding
    function List_Reference (Container : aliased in out List; Position  : Cursor) return Reference_Type;

    overriding
    function List_Reference (Container : aliased in out List; Index : Index_Type) return Reference_Type;

    overriding
    function Iterate (Container : in List) return Iterator_Interface'Class;

private

    type Element_Array is array (Index_Type range <>) of aliased Element_Type;

    type List(Last : Index_Base) is new List_Interface with record
        data : Element_Array(Index_Type'First .. Last);
    end record;

    function Has_Element (L : List; Position : Index_Base) return Boolean;

    -- here we also need to implement Reversible_Iterator interface
    type Iterator is new Iterator_Interface with record
        Container : List_Access;
        Index     : Index_Type'Base;
    end record;

    overriding
    function First (Object : Iterator) return Cursor;

    overriding
    function Last  (Object : Iterator) return Cursor;

    overriding
    function Next (Object   : Iterator; Position : Cursor) return Cursor;

    overriding
    function Previous (Object   : Iterator; Position : Cursor) return Cursor;


end Lists.fixed;
