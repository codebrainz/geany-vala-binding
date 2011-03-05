/*
 *  Copyright 2010 Matthew Brush  <mbrush(at)leftcick(dot)ca>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
 *  USA.
 *
 */

using Geany;

namespace Example
{
	public class Plugin
	{
		private string plugin_name = "ValaSignalExamplePlugin";
		
		/* arbitrary instance method to be called from plugin callback */
		private void set_status_bar_message (string message)
		{
			Ui.set_statusbar (true, "%s: %s", plugin_name, message);
		}
		
		/* callback handler, instance gets passed as last argument in C code */
		[CCode (instance_pos = -1)]
		public void on_document_open (GLib.Object obj, Geany.Document doc)
		{
			/* we can access our instance 'this' */
			this.set_status_bar_message (
							"Detected opening of %s".printf (doc.file_name));
		}

		public Plugin ()
		{
			geany_plugin.signal_connect (
				null, 								/* null for geany signals */
				"document-open", 					/* signal name */
				true, 								/* occur other signals */
				(GLib.Callback) on_document_open,	/* our callback */
				this 								/* pass instance as user_data so we
													 * can access it from within the
													 * callback */
			);
		}

	}
}

/* outside of namespace or use [CCode(cname="foo")] to rename */

public	Geany.Plugin 		geany_plugin;
public	Data 				geany_data;
public	Functions 			geany_functions;
private	Example.Plugin		example_plugin;

public int plugin_version_check (int abi_version)
{
	return Geany.Plugin.version_check (abi_version, 185);
}

public void plugin_set_info (Geany.Plugin.Info info)
{
	info.set ("ValaSignalExamplePlugin",
			  "Prints message to status bar/window when a document is opened.",
			  "0.01", "Your Name Here");
}

public void plugin_init (Geany.Data data)
{
	example_plugin = new Example.Plugin ();
}

public void plugin_cleanup ()
{
	return;
}
