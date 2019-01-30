with Ada.Text_IO; use Ada.Text_IO;

package body algorithmic is

    function  Do_Naive_Calculation(NIC : Naive_Interface'Class;
                                     input : Integer) return Integer is
    begin
        Put("<naive>");
        return input + NIC.Get_Data**3;
        -- yes, this is blatantly trivial example, with "optimization" just storing
        -- that cubed integer at initialization.
        -- But it illustrates the point
    end;


    function  Do_Optimized_Calculation(OIC : Optimized_Interface'Class;
                                     input : Integer) return Integer is
    begin
        Put("<optim>");
        return input + OIC.Get_Extra_Data;
    end;


    function do_some_calc_messy(UIC : Unrelated_Interface'Class;
                                input : Integer; IFC : Naive_Interface'Class) return Integer
    is
    begin
        if IFC in Optimized_Interface'Class then
            return Optimized_Interface(IFC).Do_Optimized_Calculation(input);
        else
            return IFC.Do_Naive_Calculation(input);
        end if;
    end;

    function do_some_calc_oop  (UIC : Unrelated_Interface'Class;
                                input : Integer; IFC : Naive_Interface'Class) return Integer
    is
    begin
        return IFC.Do_Complex_Calculation(input);
    end;


end algorithmic;
