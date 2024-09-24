using BlazorBootstrap;
using Microsoft.AspNetCore.Components.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InstaFood.Shared.NavMenu
{
    public static class NavMenuList
    {
        public static IEnumerable<NavMenuItem> GetNavItems()
        {
            var navItems = new List<NavMenuItem>()
                {
                    new NavMenuItem {
                        Id = "1", Href = "/",
                        IconName = IconName.HouseDoorFill,
                        Text = "Home",
                        Match=NavLinkMatch.All,
                        Authorize = false
                    },
                     new NavMenuItem {
                        Id = "2",
                        Href = "/logout",
                        IconName = IconName.Table,
                        Text = "Logout",
                        Authorize = true,
                    },
                    new NavMenuItem {
                        Id = "5",
                        Href = "/login",
                        IconName = IconName.Lock,
                        Text = "Login",
                        Authorize = false,
                    },
                    new NavMenuItem {
                        Id = "6",
                        Href = "/signup",
                        IconName = IconName.Lock,
                        Text = "Sign Up",
                        Authorize = false,
                    }
                };
            return navItems;
        }
    }
}
