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
with Iface_lists.Fixed;
with Iface_lists.Dynamic;
with Iface_lists.Vectors;

with Base; use Base;

procedure Test_list_combo is

    package ACV is new Ada.Containers.Vectors(Base.Index, Base_Fixed5);
    package PL  is new Iface_Lists(Base.Index_Base, Base_Interface);
    package PLF is new PL.Fixed(Base_Fixed5);
    package PLDD is new PL.Dynamic(Base_Dynamic);
    package PLDV is new PL.Dynamic(Base_Vector);
    package PLVV is new PL.Vectors(Base_Vector);

--     lc : PL.List_Interface'Class := PLD.To_Vector(5);


begin  -- main
    Put_Line("testing Ada.Containers.Vectors..");
    declare
        v  : ACV.Vector := ACV.To_Vector(5);
    begin
        Put("assigning values .. ");
        for i in Base.Index range 1 .. 5 loop
            v(i) := set_idx_fixed(i);
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
            lf(i) := Base_Interface'Class(set_idx_fixed(i));
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
    --
    New_Line;
    Put_Line("testing Lists.Dynamic with Base_Dynamic ..");
    declare
        use PLDD;
        ld : PLDD.List   := To_Vector(5);
    begin
        Put("assigning values .. ");
        for i in Base.Index range 1 .. 5 loop
            New_Line; Put("   i="&i'Img);
            ld(i) := Base_Interface'Class(set_idx_dynamic(i));
        end loop;
        Put_Line("done;  values (of-loop): ");
        for item of ld loop
            item.print;
        end loop;
        Put_Line("now direct indexing: ");
        for i in Base.Index range 1 .. 5 loop
            declare
                item : Base_Dynamic := Base_Dynamic(ld(i).Data.all);
            begin
                item.print;
            end;
        end loop;
    end;
    New_Line;
    --
    New_Line;
    Put_Line("testing Lists.Dynamic with Base_Vector ..");
    declare
        use PLDV;
        ld : PLDV.List   := To_Vector(5);
    begin
        Put("assigning values .. ");
        for i in Base.Index range 1 .. 5 loop
            New_Line; Put("   i="&i'Img);
            ld(i) := Base_Interface'Class(set_idx_vector(i)); -- this assignment of the constructed vector seems to trigger that weird storage errors
            -- what's more, simply changing whitespace - adding a line-break between New_Line and Put
            -- changes "heap exhausted" into "stack overflow" error..
        end loop;
        Put_Line("done;  values (of-loop): ");
        for item of ld loop
            item.print;
        end loop;
        Put_Line("now direct indexing: ");
        for i in Base.Index range 1 .. 5 loop
            declare
                item : Base_Vector := Base_Vector(ld(i).Data.all);
            begin
                item.print;
            end;
        end loop;
    end;
    New_Line;
    --
end Test_List_combo;
