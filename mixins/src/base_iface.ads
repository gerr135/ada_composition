--
-- This package contains base interface and types to be mixed
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

package base_iface is

    -- The interface providing mix-in functionality
    type The_Interface is limited interface;

    procedure simple        (Self : The_Interface) is abstract;
    procedure compound      (Self : The_Interface) is abstract;
    procedure redispatching (Self : The_Interface) is abstract;
    
    procedure class_wide    (Self : The_Interface'Class);

end base_iface;
