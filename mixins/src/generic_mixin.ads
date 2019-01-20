with base_iface; use base_iface;

generic
    type Base is tagged limited private;
package generic_mixin is

    type Derived is new Base and The_Interface with null record;

    overriding procedure bare    (Self : Derived);
    overriding procedure compound(Self : Derived);

end generic_mixin;
