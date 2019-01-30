--
-- This module contains data storage type hierarchy.
--
-- Copyright (c) 2019, George Shapovalov <gshapovalov@gmail.com>
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with algorithmic;
use  algorithmic;

package data_storage is

    type Naive_Data is new Naive_Interface with record
        data : Integer;
    end record;

    overriding function  Get_Data (ND : Naive_Data) return Integer;
    overriding procedure Set_Data (ND : in out Naive_Data; data : Integer);

    overriding
    function Do_Complex_Calculation(ND : Naive_Data; input : Integer) return Integer;


    type Optimized_Data is new Naive_Data and Optimized_Interface with record
        extra_data : Integer;
    end record;

    overriding function  Get_Extra_Data (OD : Optimized_Data) return Integer;
    overriding procedure Set_Extra_Data (OD : in out Optimized_Data; data : Integer);

    overriding
    function Do_Complex_Calculation(OD : Optimized_Data; input : Integer) return Integer;


    pragma Inline(Get_Data, Set_Data, Get_Extra_Data, Set_Extra_Data);


    -------------------------------------
    --  completion of Unrelated_Interface
    type Unrelated_Type is new Unrelated_Interface with null record;


end data_storage;
