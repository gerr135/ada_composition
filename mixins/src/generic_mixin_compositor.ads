--
-- This is a very basic wrapper package performing proper instantiations and defining types.
-- Everything can be done explicitly in a few lines of code, as shown in main demo procedure.
-- However this is shown for completeness and also to demonstrate how partial view can
-- present inheritance in a much more evident form. Full definition in a private part
-- is exactly the same as in main demo code.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with base_iface; use base_iface;
with base_type;  use base_type;
with generic_mixin;

package generic_mixin_compositor is

    type Extension is limited new The_Interface with private;

    type Mixin is new The_Type and The_Interface with private;

    type Mixin_Child is new Mixin with private;

    overriding procedure simple       (Self : Mixin_Child);
--     overriding procedure compound     (Self : Mixin_Child);
--     overriding procedure redispatching(Self : Mixin_Child);

private

    type Stub is tagged limited null record; -- needed for generic
    package P_stub is new generic_mixin(Base=>Stub);
    type Extension is limited new P_stub.Derived with null record;

    package P_base1 is new generic_mixin(Base=>The_Type);
    type Mixin is new P_base1.Derived with null record;

    -- NOTE:  You can chain multiple mixins to get defaults for various interfaces.
    -- For Example:
    --   package A_Pkg is new A_Mixin(Base => Some_Base);
    --   package B_Pkg is new B_Mixin(Base => A_Pkg.Derived);
    -- This will add both interfaces from A_Mixin and B_Mixin to the base type.

    ---------------
    -- try further inheritance and overriding various methods
    type Mixin_Child is new Mixin with null record;

end generic_mixin_compositor;
