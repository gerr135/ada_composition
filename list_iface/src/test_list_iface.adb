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
-- with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Ada.Containers.Vectors;
with lists.dynamic;
with lists.fixed;

procedure Test_list_iface is
    procedure printUsage is
        use Ada.Text_IO;
    begin
        Put_Line ("test containers.vectors indexing and interfaces with indexing and iterators");
        New_Line;
        Put_Line ("usage:");
        Put_Line ("   " & Ada.Command_Line.Command_Name & " [-h -g -n: -v]  positional");
        New_Line;
        Put_Line ("options:");
        --  only short options for now
        Put_Line ("-h      print this help");
        Put_Line ("-g      turn on debug output");
    end printUsage;

    use Ada.Text_IO;

    type TstType is new Integer;
    package ACV is new Ada.Containers.Vectors(Positive, TstType);
    package PL  is new Lists(Natural, TstType);
    package PLD is new PL.dynamic;
    package PLF is new PL.fixed;
    
    v : ACV.Vector;
    ld : PLD.List;
    lf : PLF.List(5);
    use ACV, PLD;

begin  -- main
    Put_Line("testing Ada.Containers.Vectors..");
    Put("assignin values .. ");
    for i in Positive range 1 .. 5 loop
        v := v & TstType(i);
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
    Put("assignin values .. ");
    for i in Positive range 1 .. 5 loop
        ld := ld & TstType(i);
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
    Put("assignin values .. ");
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

end Test_List_iface;
