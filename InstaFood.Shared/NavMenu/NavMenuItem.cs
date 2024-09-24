using BlazorBootstrap;
using Microsoft.AspNetCore.Components.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InstaFood.Shared.NavMenu
{
    public class NavMenuItem
    {
        public string Id { get; set; }
        public string Href { get; set; }
        public IconName IconName { get; set; }
        public string Text { get; set; }
        public NavLinkMatch Match { get; set; }
        public bool Authorize { get; set; }
        public string Roles { get; set; }
    }
}
