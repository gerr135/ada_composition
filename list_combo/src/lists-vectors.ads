--
-- This implementation overlays Ada.Containers.Vectors.Vector right over the interface.
-- This is a less evident composition, but (with minimal code changes) allows
-- direct access to all ACV.Vector methods, even those not explicitly declared.
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
    type Element_Type is new Element_Interface with private;
package Lists.Vectors is

    package ACV is new Ada.Containers.Vectors(Index_Type, Element_Type);

    type List is new ACV.Vector and List_Interface with private;

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

    type List is new ACV.Vector and List_Interface with null record;

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


end Lists.Vectors;
