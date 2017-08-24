﻿using System.Web;
using System.Web.Optimization;

namespace TLTY
{
	public class BundleConfig
	{
		// For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
		public static void RegisterBundles(BundleCollection bundles)
		{
			bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
						"~/Content/ClientTheme/js/jquery-2.0.3.min.js"));

			bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
						"~/Scripts/jquery.validate*"));

			// Use the development version of Modernizr to develop with and learn from. Then, when you're
			// ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
			bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
						"~/Scripts/modernizr-*"));

			bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                        "~/Content/ClientTheme/js/bootstrap.min.js",
						"~/Scripts/jquery.nicescroll.js"));

			bundles.Add(new StyleBundle("~/Content/css").Include(
					  "~/Content/ClientTheme/css/bootstrap.css",
					  "~/Content/ClientTheme/css/icon.css",
					  "~/Content/ClientTheme/css/vinhstyle.css"));


			//admin

			bundles.Add(new StyleBundle("~/Content/Admin/css").Include(
					  "~/Content/AdminTheme/vendor/bootstrap/css/bootstrap.min.css",
					  "~/Content/AdminTheme/vendor/metisMenu/metisMenu.min.css",
					  "~/Content/AdminTheme/vendor/datatables-plugins/dataTables.bootstrap.css",
					  "~/Content/AdminTheme/vendor/datatables-responsive/dataTables.responsive.css",
					  "~/Content/AdminTheme/dist/css/sb-admin-2.css"
					  ));

			bundles.Add(new ScriptBundle("~/bundles/Admin/modernizr").Include(
						"~/Scripts/modernizr-*"));

			bundles.Add(new ScriptBundle("~/bundles/Admin/jquery").Include(
						"~/Content/AdminTheme/vendor/jquery/jquery.min.js",
						"~/Content/AdminTheme/vendor/bootstrap/js/bootstrap.min.js",
					  "~/Content/AdminTheme/vendor/metisMenu/metisMenu.min.js",
					  "~/Content/AdminTheme/vendor/datatables/js/jquery.dataTables.min.js",
					  "~/Content/AdminTheme/vendor/datatables-plugins/dataTables.bootstrap.min.js",
					  "~/Content/AdminTheme/vendor/datatables-responsive/dataTables.responsive.js",
					  "~/Content/AdminTheme/dist/js/sb-admin-2.js"));

			bundles.Add(new ScriptBundle("~/bundles/Admin/bootstrap").Include(
					  "~/Content/AdminTheme/js/create-modal.js",
					  "~/Content/AdminTheme/js/detail-modal.js",
					  "~/Content/AdminTheme/js/edit-modal.js",
					  "~/Content/AdminTheme/js/delete-modal.js",
					  "~/Content/AdminTheme/js/Controller/AccountController.js",
					  "~/Content/AdminTheme/js/ChangeImages.js",
					  "~/Content/AdminTheme/js/Controller/InstructionController.js",
					  "~/Content/AdminTheme/js/Controller/InstructionController2.js",
					  "~/Scripts/jquery.nicescroll.js"
				));

			BundleTable.EnableOptimizations = true;
		}
	}
}