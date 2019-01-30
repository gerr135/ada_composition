--
-- This module contains interfaces implementing algorithms, but no data storage.
--
-- Copyright (c) 2019, George Shapovalov <gshapovalov@gmail.com>
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

package algorithmic is

    type Naive_Interface is interface;

    function  Get_Data (NI : Naive_Interface) return Integer is abstract;
    procedure Set_Data (NI : in out Naive_Interface; data : Integer) is abstract;


    type Optimized_Interface is interface and Naive_Interface;

    procedure Set_Extra_Data (OI : in out Naive_Interface; data : Integer) is abstract;


    ------------------------------------------
    --  class wide utility - algorithms
    function  Do_Complex_Calculation(NIC : Naive_Interface'Class;     input : Integer) return Integer;
    function  Do_Complex_Calculation(OIC : Optimized_Interface'Class; input : Integer) return Integer;

end algorithmic;
