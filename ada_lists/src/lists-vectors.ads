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
package Lists.Vectors is

    package ACV is new Ada.Containers.Vectors(Index_Type, Element_Type);

    type List is new ACV.Vector and List_Interface with private;

    overriding
    function Element_Constant_Reference (Container : aliased in List; Position  : Cursor) return Constant_Reference_Type;

    overriding
    function Element_Constant_Reference (Container : aliased in List; Index : Index_Type) return Constant_Reference_Type;

    overriding
    function Element_Reference (Container : aliased in out List; Position  : Cursor) return Reference_Type;

    overriding
    function Element_Reference (Container : aliased in out List; Index : Index_Type) return Reference_Type;

    overriding
    function Iterate (Container : in List) return Iterator_Interface'Class;


    --  These (below) are present in AC.Vectors, but are masked by new definition in Lists.ads
    --  so, we have to add some conversion glue to pass the calls..
    overriding
    function Length (Container : aliased in out List) return Index_Base;

    overriding
    function First_Index(Container : aliased in out List) return Index_Type;

    overriding
    function Last_Index (Container : aliased in out List) return Index_Type;


    ---- Extras --
    -- Appends and others are directly inherited from ACV.Vector..

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
