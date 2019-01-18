package base_iface is

    type The_Interface is limited interface;

    procedure m1(Self : The_Interface) is abstract;
    procedure m2(Self : The_Interface) is abstract;
    procedure m3(Self : The_Interface) is abstract;

end base_iface;
