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

    -- placeholder primitive intended to glue back class-wide method into type hierarchy
    -- the gueing has to be done in implementer types, by calling appropriate class-wide
    function Do_Complex_Calculation(NI : Naive_Interface; input : Integer) return Integer is abstract;


    type Optimized_Interface is interface and Naive_Interface;

    function  Get_Extra_Data (OI : Optimized_Interface) return Integer is abstract;
    procedure Set_Extra_Data (OI : in out Optimized_Interface; data : Integer) is abstract;


    ------------------------------------------
    --  class wide utility - algorithms
    function  Do_Naive_Calculation    (NIC : Naive_Interface'Class;     input : Integer) return Integer;
    function  Do_Optimized_Calculation(OIC : Optimized_Interface'Class; input : Integer) return Integer;
    -- Unfortunately we cannot use the same name for both methods
    -- In fact we can declare and implement 2 such methods of the same name
    -- but there is no way to use them, as compiler cannot decide which one to call..
    --
    -- Here we could really benefit from allowing non class-wide methods to be non-abstract
    -- or null in Ada, in case we need to override the code and use a uniform call interface..
    -- This can be handy in some situations.
    -- Lets say, we intend to use our algorithms in some other object and we want to keep
    -- the invocation code simple. We could do a many-if or a switch invocation, but that
    -- can look rather messy for a more complex logic. Plus, what's even the point of having OOP
    -- if we cannot use it?
    --
    -- One way to go about "fixing" this is by
    -- The ways to go about it are shown below

    type Unrelated_Interface is interface;
    -- could be made tagged null record just the same in our case
    -- keep it an interface for consistency (to follow through with ideology of algorithm and data separation)

    function do_some_calc_messy(UIC : Unrelated_Interface'Class;
                                input : Integer; IFC : Naive_Interface'Class)
                                return Integer;
    --
    function do_some_calc_oop  (UIC : Unrelated_Interface'Class;
                                input : Integer; IFC : Naive_Interface'Class)
                                return Integer;


end algorithmic;
