with base_iface; use base_iface;

package oop_mixin is

    type Derived is limited new The_Interface with null record;

    overriding procedure simple       (Self : Derived);
    overriding procedure compound     (Self : Derived);
    overriding procedure redispatching(Self : Derived);

end oop_mixin;
