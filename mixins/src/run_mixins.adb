--
-- Main routines testing/illustrating  the mixins.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with Ada.Text_IO; use Ada.Text_IO;
with base_iface; use base_iface;
with base_type;  use base_type;
with generic_mixin;
with generic_mixin_compositor;

procedure run_mixins is

begin
    Put_Line("Starting methods mixin demo,");
    Put_Line("generic_mixin");
    declare
        -- this adds the methods but the "direct inheritance" is not as visually evident
        -- that can be shown via public/private parts as shown in ..
        package P_base1 is new generic_mixin(Base=>The_Type);
        type Mixin is new P_base1.Derived with null record;
        --
        type Stub is tagged null record;
        package P_stub is new generic_mixin(Base=>Stub);
        type Extension is new P_stub.Derived with null record;
        --
        M : Mixin;
        E : Extension;
    begin
        Put_Line("  direct declaration:");
        Put_Line("    mixin:");
        M.method;
        M.simple;
        M.compound;
        M.redispatching;
        --
        Put_Line("    extension:");
        E.simple;
        E.compound;
        E.redispatching;
    end;
    declare
        -- this uses the compositor, hiding generic instantiation but exposing
        -- (logic of) type inheritance (see the corresponding module).
        use generic_mixin_compositor;
        M : Mixin;
        E : Extension;
        MC : Mixin_Child;
    begin
        Put_Line("  compositor:");
        Put_Line("    extension:");
        E.simple;
        E.compound;
        E.redispatching;
        --
        Put_Line("    mixin:");
        M.method;
        M.simple;
        M.compound;
        M.redispatching;
        --
        Put_Line("    Mixin_Child:");
        MC.method;
        MC.simple;
        MC.compound;      -- this should output gm:simple
        MC.redispatching; -- this should output MC:simple
    end;
end run_mixins;
