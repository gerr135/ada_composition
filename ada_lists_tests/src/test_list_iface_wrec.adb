--
-- Tests of lists of private (non-tagged) types
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
with lists.Bounded;
with lists.Dynamic;
with lists.Vectors;

procedure Test_list_iface_wrec is

    type Element_Type is new Integer;

    package ACV is new Ada.Containers.Vectors(Positive, Element_Type);

    package PL  is new Lists(Natural, Element_Type);
    package PLF is new PL.Fixed;
    package PLB is new PL.Bounded;
    package PLD is new PL.Dynamic;
    package PLV is new PL.Vectors;

begin  -- main
    Put_Line("testing Ada.Containers.Vectors..");
    declare
        type VRec is record
            f  : ACV.Vector;
        end record;
        v : VRec := (f => ACV.To_Vector(5));
    begin
        Put("assigning values .. ");
        for i in Integer range 1 .. 5 loop
            v.f(i) := Element_Type(i);
        end loop;
        Put_Line("done;");
        Put("   indices: First =" & v.f.First_Index'img & ", Last =" & v.f.Last_Index'img);
        Put_Line(", Length =" & v.f.Length'img);
        Put("   values, the 'of loop': ");
        for n of v.f loop
            Put(n'Img);
        end loop;
        Put("; direct indexing: ");
        for i in Positive range 1 .. 5 loop
            Put(Element_Type'Image(v.f(i)));
        end loop;
    end;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing Lists.Fixed..");
    declare
        type FRec (N : Positive) is record
            f  : PLF.List(N);
        end record;
        lf : FRec(5);
    begin
        Put("assigning values .. ");
        for i in Integer range 1 .. 5 loop
            lf.f(i) := Element_Type(i);
        end loop;
        Put_Line("done;");
        Put("   indices: First =" & lf.f.First_Index'img & ", Last =" & lf.f.Last_Index'img);
        Put_Line(", Length =" & lf.f.Length'img);
        Put("   values, the 'of loop': ");
        for n of lf.f loop
            Put(n'Img);
        end loop;
        Put("; direct indexing: ");
        for i in Positive range 1 .. 5 loop
            Put(Element_Type'Image(lf.f(i)));
        end loop;
    end;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing Lists.Bounded..");
    declare
        type BRec (N : Positive) is record
            f  : PLB.List(N);
        end record;
        lb : BRec(5);
    begin
        Put("assigning values .. ");
        for i in Integer range 1 .. 5 loop
            lb.f(i) := Element_Type(i);
        end loop;
        Put_Line("done;");
        Put("   indices: First =" & lb.f.First_Index'img & ", Last =" & lb.f.Last_Index'img);
        Put_Line(", Length =" & lb.f.Length'img);
        Put("   values, the 'of loop': ");
        for n of lb.f loop
            Put(n'Img);
        end loop;
        Put("; direct indexing: ");
        for i in Positive range 1 .. 5 loop
            Put(Element_Type'Image(lb.f(i)));
        end loop;
    end;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing Lists.Dynamic..");
    declare
        ld : PLD.List   := PLD.To_Vector(5);
    begin
        Put("assigning values .. ");
        for i in Integer range 1 .. 5 loop
            ld(i) := Element_Type(i);
        end loop;
        Put_Line("done;");
        Put("   indices: First =" & ld.First_Index'img & ", Last =" & ld.Last_Index'img);
        Put_Line(", Length =" & ld.Length'img);
        Put("   values, the 'of loop': ");
        for n of ld loop
            Put(n'Img);
        end loop;
        Put("; direct indexing: ");
        for i in Positive range 1 .. 5 loop
            Put(Element_Type'Image(ld(i)));
        end loop;
    end;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing Lists.Vectors ..");
    declare
        lv : PLV.List   := PLV.To_Vector(5);
    begin
        Put("assigning values .. ");
        for i in Integer range 1 .. 5 loop
            lv(i) := Element_Type(i);
        end loop;
        Put_Line("done;");
        Put("   indices: First =" & lv.First_Index'img & ", Last =" & lv.Last_Index'img);
        Put_Line(", Length =" & Ada.Containers.Count_Type'Image(lv.Length)); -- apparently ACV.Vector methods are not masked enough here..
        Put("   values, the 'of loop': ");
        for n of lv loop
            Put(n'Img);
        end loop;
        Put("; direct indexing: ");
        for i in Positive range 1 .. 5 loop
            Put(Element_Type'Image(lv(i)));
        end loop;
    end;
    New_Line;
    --
    --
    New_Line;
    Put_Line("testing List_Interface'Class ..");
    declare
        lc : PL.List_Interface'Class := PLD.To_Vector(5);
    begin
        Put("assigning values .. ");
        for i in Integer range 1 .. 5 loop
            lc(i) := Element_Type(i);
        end loop;
        Put_Line("done;");
        Put("   indices: First =" & lc.First_Index'img & ", Last =" & lc.Last_Index'img);
        Put_Line(", Length =" & lc.Length'img);
        Put("   values, the 'of loop': ");
        for n of lc loop
            Put(n'Img);
        end loop;
        Put("; direct indexing: ");
        for i in Positive range 1 .. 5 loop
            Put(Element_Type'Image(lc(i)));
        end loop;
    end;
    New_Line;
end Test_list_iface_wrec;
