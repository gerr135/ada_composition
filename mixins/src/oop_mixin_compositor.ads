--
-- This is a wrapper package for (non-generic) mixin.
-- As in generic case, everything can be done explicitly in a few lines of code,
-- as shown in main demo procedure. This module provides a somewhat clearer illustration by
-- keeping all relevant code in one place as well as presenting inheritance in a more
-- evident form by separating public presentation and hiding inheritance details in private part.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with base_iface; use base_iface;
with base_type;  use base_type;
with oop_mixin;

package oop_mixin_compositor is

    type Extension is limited new The_Interface with private;

    type Mixin is limited new The_Type and The_Interface with private;
    --
    overriding procedure simple       (Self : Mixin);
    overriding procedure compound     (Self : Mixin);
    overriding procedure redispatching(Self : Mixin);

    type Mixin_Child is new Mixin with private;
    -- same could be done with Extension_Child, but that would be pretty much exactly
    -- the same code/inheritance constructs

    overriding procedure simple(Self : Mixin_Child);

private

    type Extension is limited new oop_mixin.Derived with null record;
    -- this should nont need any special handling, as we can derive from interfaces directly

    type Mixin is limited new The_Type and The_Interface with record
        -- here we have to mix-in extra type as a record entry (explicitly)
        -- and provide a redirection glue code.
        inner : oop_mixin.Derived;
    end record;

    ---------------
    -- try further inheritance and overriding various methods
    type Mixin_Child is new Mixin with null record;

end oop_mixin_compositor;
