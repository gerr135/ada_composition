--
-- <one line to give the program's name and a brief idea of what it does.>
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
with vectors.dynamic;

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
    package SV is new Ada.Containers.Vectors(Positive, TstType);
    package PV is new vectors(Natural, TstType);
    package PVD is new PV.dynamic;
    
    v1 : SV.Vector;
    v2 : PVD.List;
    use SV, PVD;

begin  -- main
    Put_Line("testing Ada.Containers.Vectors..");
    Put("assignin vector values .. ");
    for i in Positive range 1 .. 5 loop
        v1 := v1 & TstType(i);
        v1(i) := TstType(i);
    end loop;
    Put("done;  values: ");
    for n of v1 loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(v1(i)));
    end loop;
    New_Line;New_Line;
    Put_Line("testing vectors.dynamic ..");
    Put("assignin vector values .. ");
    for i in Positive range 1 .. 5 loop
        v2 := v2 & TstType(i);
        v2(i) := TstType(i);
    end loop;
    Put("done;  values: ");
    for n of v2 loop
        Put(n'Img);
    end loop;
    Put("; now try direct indexing: ");
    for i in Positive range 1 .. 5 loop
        Put(TstType'Image(v2(i)));
    end loop;
    New_Line;

end Test_List_iface;
