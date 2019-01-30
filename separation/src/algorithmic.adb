package body algorithmic is

    function  Do_Complex_Calculation(NIC : Naive_Interface'Class;
                                     input : Integer) return Integer is
    begin
        return input + NIC.Get_Data**3;
    end;


    function  Do_Complex_Calculation(OIC : Optimized_Interface'Class;
                                     input : Integer) return Integer is
    begin
        return input + OIC.Get_Extra_Data;
    end;

end algorithmic;
