generic
    type Base is tagged limited private;
package generic_mixin is

    type Derived is new Base and The_Interface with null record;

    overriding procedure m1(Self : Derived);
    overriding procedure m2(Self : Derived);
    overriding procedure m3(Self : Derived);

end generic_mixin;
