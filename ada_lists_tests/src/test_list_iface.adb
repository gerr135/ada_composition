--
-- The demo of type hierarchy use: declarations, loops, dereferencing..
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
with lists.Fixed;
with lists.Dynamic;
with lists.Vectors;

procedure Test_list_iface is

    type TstType is new Integer;
    package ACV is new Ada.Containers.Vectors(Positive, TstType);
    package PL  is new Lists(Natural, TstType);
    package PLF is new PL.Fixed;
    package PLD is new PL.Dynamic;
    package PLV is new PL.Vectors;

    v  : ACV.Vector := ACV.To_Vector(5);
    lf : PLF.List(5);
    ld : PLD.List   := PLD.To_Vector(5);
    lv : PLV.List   := PLV.To_Vector(5);
    lc : PL.List_Interface'Class := PLD.To_Vector(5);


begin  -- main
    Put_Line("testing Ada.Containers.Vectors..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
        v(i) := TstType(i);
    end loop;
    Put_Line("done;");
    Put("   indices: First =" & v.First_Index'img & ", Last =" & v.Last_Index'img);
    Put_Line(", Length =" & v.Length'img);
    Put("   values, the 'of loop': ");
    for n of v loop
        Put(n'Img);
    end loop;
    Put("; direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(v(i)));
    end loop;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing Lists.Fixed ..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
        lf(i) := TstType(i);
    end loop;
    Put_Line("done;");
    Put("   indices: First =" & lf.First_Index'img & ", Last =" & lf.Last_Index'img);
    Put_Line(", Length =" & lf.NElements'img);
    Put("   values, the 'of loop': ");
    for n of lf loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(lf(i)));
    end loop;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing Lists.Dynamic ..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
        ld(i) := TstType(i);
    end loop;
    Put_Line("done;");
    Put("   indices: First =" & ld.First_Index'img & ", Last =" & ld.Last_Index'img);
    Put_Line(", Length =" & ld.NElements'img);
    Put("   values, the 'of loop': ");
    for n of ld loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(ld(i)));
    end loop;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing Lists.Vectors ..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
        lv(i) := TstType(i);
    end loop;
    Put_Line("done;");
    Put("   indices: First =" & lv.First_Index'img & ", Last =" & lv.Last_Index'img);
    Put_Line(", Length =" & lv.NElements'img);
    Put("   values, the 'of loop': ");
    for n of lv loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(lv(i)));
    end loop;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing List_Interface'Class ..");
    Put("assigning values .. ");
    for i in Positive range 1 .. 5 loop
        lc(i) := TstType(i);
    end loop;
    Put_Line("done;");
    Put("   indices: First =" & lc.First_Index'img & ", Last =" & lc.Last_Index'img);
    Put_Line(", Length =" & lc.NElements'img);
    Put("   values, the 'of loop': ");
    for n of lc loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(lc(i)));
    end loop;
    New_Line;
end Test_List_iface;
