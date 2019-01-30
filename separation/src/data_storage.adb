package body data_storage is

    overriding
    function  Get_Data (ND : Naive_Data) return Integer is
    begin
        return ND.data;
    end;

    overriding
    procedure Set_Data (ND : in out Naive_Data; data : Integer) is
    begin
        ND.data := data;
    end;

    overriding
    function Do_Complex_Calculation(ND : Naive_Data; input : Integer) return Integer is
    begin
        return Do_Naive_Calculation(ND, input);
    end;



    overriding
    function  Get_Extra_Data (OD : Optimized_Data) return Integer is
    begin
        return OD.extra_data;
    end;

    overriding
    procedure Set_Extra_Data (OD : in out Optimized_Data; data : Integer) is
    begin
        OD.extra_data := data;
    end;

    overriding
    function Do_Complex_Calculation(OD : Optimized_Data; input : Integer) return Integer is
    begin
        return Do_Optimized_Calculation(OD, input);
    end;


end data_storage;
