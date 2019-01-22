with Ada.Text_IO; use Ada.Text_IO;

package body oop_mixin_compositor is

    overriding
    procedure simple(Self : Mixin) is
    begin
        Self.inner.simple;
    end;

    overriding
    procedure compound(Self : Mixin) is
    begin
        Self.inner.compound;
    end;

    overriding
    procedure redispatching(Self : Mixin) is
    begin
        oop_mixin.Derived'Class(Self.inner).redispatching;
    end;

    overriding
    procedure simple       (Self : Mixin_Child) is
    begin
        Put_Line("      MC:simple");
    end;

end oop_mixin_compositor;
