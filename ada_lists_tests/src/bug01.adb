--
-- Short demo of the bug inducing code: tagged hierarchy as a field of discriminated record
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

procedure bug01 is

    type Element_Type is new Integer;

    package ACV is new Ada.Containers.Vectors(Positive, Element_Type);

    package PL  is new Lists(Natural, Element_Type);
    package PLF is new PL.Fixed;
    package PLD is new PL.Dynamic;
    package PLV is new PL.Vectors;


begin
    Put_Line("Ada.Containers.Vectors..");
    declare
        v : ACV.Vector := ACV.To_Vector(5);
        type VRec is record
            f  : ACV.Vector;
        end record;
        vr : VRec := (f => ACV.To_Vector(5));
    begin
        v(1) := 1;
        vr.f(1) := 1;
    end;
    --
    Put_Line("Lists.Dynamic..");
    declare
        ld : PLD.List := PLD.To_Vector(5);
        type DRec is record
            f : PLD.List;
        end record;
        ldr : DRec := (f => PLD.To_Vector(5));
        --
        type DDRec (N : Positive) is record
            f : PLD.List := PLD.To_Vector(N);
        end record;
        lddr : DDRec(5);
    begin
        ld(1) := 1;
        ldr.f(1) := 1;
        lddr.f(1) := 1;
    end;
    --
    Put_Line("Lists.Vectors..");
    declare
        lv : PLV.List := PLV.To_Vector(5);
        type VRec is record
            f : PLV.List;
        end record;
        lvr : VRec := (f => PLV.To_Vector(5));
    begin
        lv(1) := 1;
        lvr.f(1) := 1;
    end;
    --
    Put_Line("Lists.Fixed (discriminated record)");
    declare
        type FRec5 is record
            f  : PLF.List(5);
        end record;
        --
        type FRec (N : Positive) is record
            f  : PLF.List(N);
        end record;
        --
        lf   : PLF.List(5);
        lfr5 : FRec5;
        lfr  : FRec(5);
    begin
        lf(1) := 1;
        lfr5.f(1) := 1;  -- this is still fine
        lfr.f(1)  := 1;  -- this triggers the bug
    end;
end bug01;
