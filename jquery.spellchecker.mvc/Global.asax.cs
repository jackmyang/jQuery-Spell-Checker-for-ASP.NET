/*
 * jquery.spellchecker.JQuerySpellCheckerHandler.ashx - jQuery Spell Checker ASP.NET server-side implementation
 * Copyright (c) 2010, 2011 Richard Willis, Jack Yang
 * MIT license  : http://www.opensource.org/licenses/mit-license.php
 * jQuery plugin library written by Richard Willis (willis.rh@gmail.com): http://jquery-spellchecker.googlecode.com
 * .NET MVC 3 with Razor port done by Jack Yang (jackmyang@gmail.com), many thanks to Scott Scowden (rattrick1@gmail.com) for his initial prototype done in MVC3 Razor engine!
 */

using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace jquery.spellchecker.mvc
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : HttpApplication
    {
        /// <summary>
        /// Registers the global filters.
        /// </summary>
        /// <param name="filters">The filters.</param>
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        /// <summary>
        /// Registers the routes.
        /// </summary>
        /// <param name="routes">The routes.</param>
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("JQuerySpellCheckerHandler.ashx"); // NOTE, need to add the the httpHandler here to avoid MVC routing
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new {controller = "Home", action = "Index", id = UrlParameter.Optional} // Parameter defaults
                );
            routes.IgnoreRoute("JQuerySpellCheckerHandler.ashx");
        }

        /// <summary>
        /// Application start event.
        /// </summary>
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }
    }
}