--
-- This implementation encapsulates Ada.Containers.Vectors.Vector as a record entry.
-- This is a common way to compose enveloping type, requiring glue code to implement all
-- declared methods. SImple to understand, but only explicitly declared methods are available.
--
-- Copyright (C) 2018 George SHapovalov <gshapovalov@gmail.com>
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with Ada.Containers.Vectors;

generic
package Lists.dynamic is

    type List is new List_Interface with private;

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


    ---- Extras --
    overriding
    function NElements  (Container : aliased in out List) return Index_Base;

    overriding
    function First_Index(Container : aliased in out List) return Index_Type;

    overriding
    function Last_Index (Container : aliased in out List) return Index_Type;


    -- new methods from ACV.Vector pool; should really be part of interface, here is only a demo of tying all together..
    function To_Vector (Length : Index_Type) return List;

private

    package ACV is new Ada.Containers.Vectors(Index_Type, Element_Type);

    type List is new List_Interface with record
        vec : ACV.Vector;
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


end Lists.dynamic;
