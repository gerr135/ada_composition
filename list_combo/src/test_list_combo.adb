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

with Base; use Base;

procedure Test_list_combo is

    package ACV is new Ada.Containers.Vectors(Base.Index, Base.Base_Fixed5);
    package PL  is new Lists(Base.Index_Base, Base.Base_Interface);
    package PLF is new PL.Fixed(Base.Base_Fixed5);
--     package PLD is new PL.Dynamic;
--     package PLV is new PL.Vectors;

--     ld : PLD.List   := PLD.To_Vector(5);
--     lv : PLV.List   := PLV.To_Vector(5);
--     lc : PL.List_Interface'Class := PLD.To_Vector(5);


begin  -- main
    Put_Line("testing Ada.Containers.Vectors..");
    declare
        v  : ACV.Vector := ACV.To_Vector(5);
    begin
        Put("assigning values .. ");
        for i in Base.Index range 1 .. 5 loop
            v(i) := set_idx(i);
        end loop;
        Put_Line("done;  values (of-loop): ");
        for item of v loop
            item.print;
        end loop;
        Put_Line("now direct indexing: ");
        for i in Base.Index range 1 .. 5 loop
            declare
                item : Base_Fixed5 := v(i);
            begin
                item.print;
            end;
        end loop;
    end;
    New_Line;
    --
    New_Line;
    Put_Line("testing Lists.Fixed ..");
    declare
        lf : PLF.List(5);
    begin
        Put("assigning values .. ");
        for i in Base.Index range 1 .. 5 loop
            lf(i) := Base_Interface'Class(set_idx(i));
        end loop;
        Put_Line("done;  values (of-loop): ");
        for item of lf loop
            item.print;
        end loop;
        Put_Line("now direct indexing: ");
        for i in Base.Index range 1 .. 5 loop
            declare
                item : Base_Fixed5 := Base_Fixed5(lf(i).Data.all);
            begin
                item.print;
            end;
        end loop;
    end;
    New_Line;
end Test_List_combo;
