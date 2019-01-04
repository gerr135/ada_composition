--
-- a test unit.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with Ada.Command_Line, GNAT.Command_Line;
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO;

with Ada.Containers.Vectors;
with lists.dynamic;
with lists.fixed;

procedure Test_list_iface is

    type TstType is new Integer;
    package ACV is new Ada.Containers.Vectors(Positive, TstType);
    package PL  is new Lists(Natural, TstType);
    package PLD is new PL.dynamic;
    package PLF is new PL.fixed;
    
    v  : ACV.Vector := ACV.To_Vector(5);
    ld : PLD.List   := PLD.To_Vector(5);
    lf : PLF.List(5);
    lc : PL.List_Interface'Class := PLD.To_Vector(5);
--     use ACV, PLD;

begin  -- main
    Put_Line("testing Ada.Containers.Vectors..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
--         v := v & TstType(i);
        v(i) := TstType(i);
    end loop;
    Put("done;  values: ");
    for n of v loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(v(i)));
    end loop;
    New_Line;
    --
    New_Line;
    Put_Line("testing Lists.dynamic ..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
--         ld := ld & TstType(i);
        ld(i) := TstType(i);
    end loop;
    Put("done;  values: ");
    for n of ld loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(ld(i)));
    end loop;
    New_Line;
    --
    New_Line;
    Put_Line("testing Lists.fixed ..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
--         lf := lf & TstType(i); -- this one is Vectors specific, needs reimplementing &
        lf(i) := TstType(i);
    end loop;
    Put("done;  values: ");
    for n of ld loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(lf(i)));
    end loop;
    New_Line;
    --
    New_Line;
    Put_Line("testing List_Interface'Class ..");
    Put("assignin values .. ");
    for i in Positive range 1 .. 5 loop
--         lc := lc & TstType(i); -- as for .fixed, needs declaration at top level
        lc(i) := TstType(i);
    end loop;
    Put("done;  values: ");
    for n of lc loop -- this is where gnat gets confused
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(lc(i)));
    end loop;
    New_Line;
end Test_List_iface;
