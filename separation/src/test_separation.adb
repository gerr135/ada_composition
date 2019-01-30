--
-- Test unit for this demo.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with Ada.Text_IO; use Ada.Text_IO;
with data_storage; use data_storage;
with algorithmic; use algorithmic;

procedure test_separation is

begin
    Put_Line("Test of the algorithmic separation; base case");
    Put("Invoking Naive     algorithm:  ");
    declare
        ND : Naive_Data;
        result : Integer;
    begin
        ND.Set_Data(3);
        result := ND.Do_Naive_Calculation(3);
        Put_Line(" 3 + 3^3 = " & result'Img);
    end;
    Put("Invoking Optimized algorithm:  ");
    declare
        OD : Optimized_Data;
        result : Integer;
    begin
        OD.Set_Data(3);
        OD.Set_Extra_Data(3**3);
        result := OD.Do_Optimized_Calculation(3);
        Put_Line(" 3 + 3^3 = " & result'Img);
    end;
    New_Line;
    Put_Line("Testing invocation by 3rd parties");
    Put("Naive     algorithm,  ");
    declare
        ND : Naive_Data;
        UT : Unrelated_Type;
        result : Integer;
    begin
        ND.Set_Data(3);
        result := do_some_calc_messy(UT, 3, ND);
        Put("messy: 3 + 3^3 = " & result'Img & ",  ");
        result := do_some_calc_oop(UT, 3, ND);
        Put_Line("oop: 3 + 3^3 = " & result'Img);
    end;
    Put("Optimized algorithm,  ");
    declare
        OD : Optimized_Data;
        UT : Unrelated_Type;
        result : Integer;
    begin
        OD.Set_Data(3);
        result := do_some_calc_messy(UT, 3, OD);   -- NOTE how our invocation is exactly the same as in naive case!!
        Put("messy: 3 + 3^3 = " & result'Img & ",  ");
        result := do_some_calc_oop(UT, 3, OD);
        Put_Line("oop: 3 + 3^3 = " & result'Img);  -- ditto here
    end;
end test_separation;
