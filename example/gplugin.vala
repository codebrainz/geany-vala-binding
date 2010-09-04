/*
 *  Copyright 2010 Colomban Wendling  <ban(at)herbesfolles(dot)org>
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
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 */

using Geany;

/* Geany sets these variables at plugin registration time */
public Plugin		geany_plugin;
public Data			geany_data;
public Functions	geany_functions;


/*----------------- Plugin-global variables (prefix with G_) -----------------*/

private GLib.SList<unowned Gtk.Widget>	G_destroy_widget_stack;


/*---------------------------- Begin plugin code ----------------------------*/

/* deletes the given line from a scintilla object */
private bool sci_delete_line (Sci sci, int l, bool include_eol = true)
{
	var line_count = sci.get_line_count ();
	var start = sci.get_position_from_line (l);
	var end = sci.get_line_end_position (l);
	
	if (include_eol && line_count > l + 1)
		end += sci.get_eol_char_len ();
	sci.set_target_start (start);
	sci.set_target_end (end);
	sci.replace_target ("", false);
	
	return line_count != sci.get_line_count ();
}

/* removes duplicated lines from a document */
private int remove_duplicated_lines (Document? doc)
{
	int n_repl = 0;
	
	if (doc.is_valid ()) {
		var sci = doc.editor.sci;
		
		sci.start_undo_action ();
		string? prev_line = null;
		for (var l = 0; l < sci.get_line_count (); l++) {
			var line = sci.get_line (l, false);
			
			if (line == prev_line && sci_delete_line (sci, l)) {
				l--;
				n_repl ++;
			}
			prev_line = line;
		}
		sci.end_undo_action ();
		
		Msgwin.status_add ("%s: removed %d doubles.", doc.get_filename (), n_repl);
	}
	
	return n_repl;
}

/*------------------------- Plugin registration & co -------------------------*/

public int plugin_version_check (int abi_version)
{
	return Plugin.version_check (abi_version, 185);
}

public void plugin_set_info (Plugin.Info info)
{
	info.set ("Vala plugin", "A sample plugin for Geany written in Vala",
			  "0.1", "John Doe");
}

public void plugin_init (Geany.Data data)
{
	Gtk.MenuItem item;
	
	unowned Gtk.MenuShell? menu = Ui.lookup_widget (geany_data.main_widgets.window,
													"menu_document1_menu") as Gtk.MenuShell;
	if (menu == null) {
		menu = geany_data.main_widgets.tools_menu;
	} else {
		item = new Gtk.SeparatorMenuItem ();
		menu.append (item);
		G_destroy_widget_stack.append (item);
		item.show ();
	}
	item = new Gtk.MenuItem.with_label ("Remove duplicated lines");
	item.activate.connect (() => {
		remove_duplicated_lines (Document.get_current ());
	});
	menu.append (item);
	G_destroy_widget_stack.append (item);
	item.show ();
}

public void plugin_cleanup ()
{
	foreach (var w in G_destroy_widget_stack) {
		w.destroy ();
	}
}
