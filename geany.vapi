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

[CCode (cheader_filename = "geanyplugin.h")]
namespace Geany {
	[CCode (cname = "GeanyApp")]
	public class App {
		public bool								debug_mode;
		public string							configdir;
		public string							datadir;
		public string							docdir;
		public unowned TagManager.Workspace		tm_workspace;
		public Project							project;
	}
	[CCode (cname = "GeanyInterfacePrefs")]
	public struct InterfacePrefs {
		public bool		sidebar_symbol_visible;
		public bool		sidebar_openfiles_visible;
		public string	editor_font;
		public string	tagbar_font;
		public string	msgwin_font;
		public bool		show_notebook_tabs;
		public int		tab_pos_editor;
		public int		tab_pos_msgwin;
		public int		tab_pos_sidebar;
		public bool		statusbar_visible;
		public bool		show_symbol_list_expanders;
		public bool		notebook_double_click_hides_widgets;
		public bool		highlighting_invert_all;
		public int		sidebar_pos;
		public bool		msgwin_status_visible;
		public bool		msgwin_compiler_visible;
		public bool		msgwin_messages_visible;
		public bool		msgwin_scribble_visible;
	}
	[CCode (cname = "GeanyIndentPrefs")]
	public struct IndentPrefs {
		public int			width;
		public IndentType	type;
		public int			hard_tab_width;
		public AutoIndent	auto_indent_mode;
		public bool			detect_type;
	}
	[CCode (cname = "GeanyEditorPrefs")]
	public struct EditorPrefs {
		public IndentPrefs	indentation;
		public bool			show_white_space;
		public bool			show_indent_guide;
		public bool			show_line_endings;
		public int			long_line_global_type;
		public int			long_line_global_column;
		public string		long_line_color;
		public bool			show_markers_margin;		/* view menu */
		public bool			show_linenumber_margin;		/* view menu */
		public bool			show_scrollbars;			/* hidden pref */
		public bool			scroll_stop_at_last_line;
		public bool			line_wrapping;
		public bool			use_indicators;
		public bool			folding;
		public bool			unfold_all_children;
		public bool			disable_dnd;
		public bool			use_tab_to_indent;	/* makes tab key indent instead of insert a tab char */
		public bool			smart_home_key;
		public bool			newline_strip;
		public bool			auto_complete_symbols;
		public bool			auto_close_xml_tags;
		public bool			complete_snippets;
		public int			symbolcompletion_min_chars;
		public int			symbolcompletion_max_height;
		public bool			brace_match_ltgt;	/* whether to highlight < and > chars (hidden pref) */
		public bool			use_gtk_word_boundaries;	/* hidden pref */
		public bool			complete_snippets_whilst_editing;	/* hidden pref */
		public int			line_break_column;
		public bool			auto_continue_multiline;
		public string		comment_toggle_mark;
		public uint			autocompletion_max_entries;
		public uint			autoclose_chars;
		public bool			autocomplete_doc_words;
		public bool			completion_drops_rest_of_word;
		public string		color_scheme;
		public int			show_virtual_space;
		public bool			long_line_global_enabled;
	}
	[CCode (cname = "GeanyToolbarPrefs")]
	public struct ToolbarPrefs {
		public bool				visible;
		public Gtk.IconSize		icon_size;
		public Gtk.ToolbarStyle	icon_style;
		public bool				use_gtk_default_style;
		public bool				use_gtk_default_icon;
		public bool				append_to_menu;
	}
	[CCode (cname = "GeanyPrefs")]
	public struct Prefs {
		public bool		load_session;
		public bool		load_plugins;
		public bool		save_winpos;
		public bool		confirm_exit;
		public bool		beep_on_errors;		/* use utils_beep() instead */
		public bool		suppress_status_messages;
		public bool		switch_to_status;
		public bool		auto_focus;
		public string	default_open_path;
		public string	custom_plugin_path;
	}
	[CCode (cname = "GeanyToolPrefs")]
	public struct ToolPrefs {
		public string	browser_cmd;
		public string	term_cmd;
		public string	grep_cmd;
		public string	context_action_cmd;
	}
	[CCode (cname = "GeanySearchPrefs")]
	public struct SearchPrefs {
		public bool	suppress_dialogs;
		public bool	use_current_word;
		public bool	use_current_file_dir;
	}
	[CCode (cname = "GeanyTemplatePrefs")]
	public struct TemplatePrefs {
		public string	developer;
		public string	company;
		public string	mail;
		public string	initials;
		public string	version;
		public string	year_format;
		public string	date_format;
		public string	datetime_format;
	}
	[CCode (cname = "GeanyFilePrefs")]
	public struct FilePrefs {
		public int		default_new_encoding;
		public int		default_open_encoding;
		public bool		final_new_line;
		public bool		strip_trailing_spaces;
		public bool		replace_tabs;
		public bool		tab_order_ltr;
		public bool		tab_order_beside;
		public bool		show_tab_cross;
		public uint		mru_length;
		public int		default_eol_character;
		public int		disk_check_timeout;
		public bool		cmdline_new_files;
		public bool		use_safe_file_saving;
	}
	[CCode (cname = "GeanyBuildInfo")]
	public struct BuildInfo {
	}
	[Compact]
	[CCode (cname = "GeanyData")]
	public class Data {
		public App						app;
		public MainWidgets				main_widgets;
		public GLib.PtrArray			documents_array;
		public GLib.PtrArray			filetypes_array;
		public Prefs					prefs;
		public InterfacePrefs			interface_prefs;
		public ToolbarPrefs				toolbar_prefs;
		public EditorPrefs				editor_prefs;
		public FilePrefs				file_prefs;
		public SearchPrefs				search_prefs;
		public ToolPrefs				tool_prefs;
		public TemplatePrefs			template_prefs;
		public BuildInfo				build_info;
		public GLib.SList<Filetype>		filetypes_by_title;
	}
	[CCode (cprefix = "dialogs_")]
	namespace Dialogs {
		[PrintfFormat]
		public bool		show_question (string text, ...);
		[PrintfFormat]
		public void		show_msgbox (Gtk.MessageType type, string text, ...);
		public bool		show_save_as ();
		public bool		show_input_numeric (string title, string label_text,
											out double *value, double min, double max, double step);
	}
	[Compact]
	[CCode (cname = "struct GeanyDocument",
			cprefix = "document_",
			free_function = "document_close",
			has_type_id = false)]
	public class Document {
		public bool						valid;
		public int						idx;
		public bool						has_tags;
		public string					file_name;
		public string					encoding;
		public bool						has_bom;
		public Editor					editor;
		public Filetype					file_type;
		public TagManager.WorkObject	tm_file;
		public bool						readonly;
		public bool						changed;
		public string					real_path;
		
		[CCode (cname = "DOC_FILENAME")]
		public unowned string get_filename ();
		[CCode (cname = "DOC_VALID")]
		public bool is_valid ();
		
		public static unowned Document	new_file (string? utf8_filename = null, Filetype? ft = null, string? text = null);
		public static unowned Document?	get_current ();
		public static unowned Document?	get_from_page (uint page_num);
		public static unowned Document?	find_by_filename (string utf8_filename);
		public static unowned Document?	find_by_real_path (string realname);
		public bool						save_file (bool force);
		public static unowned Document	open_file (string locale_filename, bool readonly,
												   Filetype ft, string forced_enc);
		public static void				open_files (GLib.SList filenames, bool readonly,
													Filetype ft, string forced_enc);
		public static bool				remove_page (uint page_num);
		public bool						reload_file (string forced_enc);
		public void						set_encoding (string new_encoding);
		public void						set_text_changed (bool changed);
		public void						set_filetype (Filetype type);
		public bool						close ();
		public static unowned Document?	index (int idx);
		public bool						save_file_as (string utf8_fname);
		public void						rename_file (string new_filename);
		public Gdk.Color				get_status_color ();
		public string					get_basename_for_display (int length);
		public int						get_notebook_page ();
	}
	[Compact]
	[CCode (cname = "struct GeanyEditor", cprefix = "editor_")]
	public class Editor {
		public Document		document;
		public Sci			sci;
		public bool			line_wrapping;
		public bool			auto_indent;
		public float		scroll_percent;
		public bool			line_breaking;

		public unowned IndentPrefs	get_indent_prefs ();
		public Sci					create_widget ();

		public void					indicator_set_on_range (int indic, int start, int end);
		public void					indicator_set_on_line (int indic, int line);
		public void					indicator_clear (int indic);

		public void					set_indent_type (IndentType type);
		public string				get_word_at_pos (int pos, string wordchars);

		public unowned string		get_eol_char_name ();
		public int					get_eol_char_len ();
		public unowned string		get_eol_char ();

		public void					insert_text_block (string text, int insert_pos, int cursor_index,
													   int newline_indent_size, bool replace_newlines);
	}
	[CCode (cprefix = "encodings_")]
	namespace Encodings {
		public string			convert_to_utf8 (string buffer, size_t size, out string used_encoding);
		public string			convert_to_utf8_from_charset (string buffer, size_t size, string charset, bool fast);
		public unowned string	get_charset_from_index (int idx);
	}
	[CCode (cname = "filetype_id", cprefix = "GEANY_FILETYPES_", has_type_id = false)]
	public enum FiletypeID {
		NONE,
		
		PHP,
		BASIC,
		MATLAB,
		RUBY,
		LUA,
		FERITE,
		YAML,
		C,
		NSIS,
		GLSL,
		PO,
		MAKE,
		TCL,
		XML,
		CSS,
		REST,
		HASKELL,
		JAVA,
		CAML,
		AS,
		R,
		DIFF,
		HTML,
		PYTHON,
		CS,
		PERL,
		VALA,
		PASCAL,
		LATEX,
		ASM,
		CONF,
		HAXE,
		CPP,
		SH,
		FORTRAN,
		SQL,
		F77,
		DOCBOOK,
		D,
		JS,
		VHDL,
		ADA,
		CMAKE,
		MARKDOWN,
		TXT2TAGS,
		ABC,
		VERILOG,
		/* ^ append items here */
		[CCode (cname = "GEANY_MAX_BUILT_IN_FILETYPES")]
		MAX_BUILT_IN_FILETYPES
	}
	[CCode (cname = "GeanyFiletypeGroupID", cprefix = "GEANY_FILETYPE_GROUP_", has_type_id = false)]
	public enum FiletypeGroupID
	{
		NONE,
		COMPILED,
		SCRIPT,
		MARKUP,
		MISC,
		CUSTOM,
		COUNT
	}
	[CCode (cname = "struct GeanyFiletype", cprefix = "filetypes_")]
	public struct Filetype {
		public FiletypeID			id;
		public TagManager.langType 	lang;
		public string				name;
		public string				title;
		public string				extension;
		public string[]				pattern;
		public string				context_action_cmd;
		public string				comment_open;
		public string				comment_close;
		public bool					comment_use_indent;
		public FiletypeGroupID		group;
		public string				error_regex_string;
		public Filetype				*lexer_filetype;
		
		public static Filetype	detect_from_file (string utf8_filename);
		public static Filetype	lookup_by_name (string name);
		public static Filetype	index (int idx);
	}
	[CCode (cprefix = "")]
	public Filetype[] filetypes;
	[CCode (cprefix = "")]
	public GLib.SList<Filetype> filetypes_by_title;
	[Compact]
	[CCode (cname = "GeanyFunctions")]
	public class Functions {
		/* no need to fill-in, the functions are wrapped */
	}
	[CCode (cprefix = "highlighting_")]
	namespace Highlighting {
		public unowned LexerStyle	get_style (int ft_id, int style_id);
		public void					set_styles (Sci sci, Filetype ft);
	}
	[CCode (cname = "_GeanyKeyCallback")]
	public delegate void KeyCallback (uint key_id);
	[CCode (cname = "GeanyKeyBinding")]
	public struct KeyBinding {
		public uint				key;
		public Gdk.ModifierType	mods;
		public string 			name;
		public string 			label;
		public KeyCallback		@callback;
		public Gtk.Widget		menu_item;
	}
	[CCode (cprefix = "keybindings_")]
	namespace Keybindings {
		public void			send_command (uint group_id, uint key_id);
		public KeyBinding	set_item (KeyGroup group, size_t key_id, KeyCallback cb, uint key, Gdk.ModifierType mod,
									  string name, string label, Gtk.Widget menu_item);
		public KeyBinding	get_item (KeyGroup group, size_t key_id);
	}
	[CCode (cname = "GeanyKeyGroup")]
	public struct KeyGroup {}
	[CCode (cname = "_GeanyKeyGroupCallback")]
	public delegate bool KeyGroupCallback (uint key_id);
	[CCode (cname = "GeanyKeyGroupInfo")]
	public struct KeyGroupInfo {
		string	name;
		size_t	count;
	}
	[CCode (cname = "GeanyLexerStyle")]
	public struct LexerStyle {
		public int	foreground;
		public int	background;
		public bool	bold;
		public bool	italic;
	}
	[CCode (cprefix = "main_")]
	namespace Main {
		public void		reload_configuration ();
		public void		locale_init (string locale_dir, string package);
		public bool		is_realized ();
	}
	[Compact]
	[CCode (cname = "GeanyMainWidgets")]
	public class MainWidgets {
		public Gtk.Window		window;
		public Gtk.Toolbar		toolbar;
		public Gtk.Notebook		sidebar_notebook;
		public Gtk.Notebook		notebook;
		public Gtk.MenuShell	editor_menu;
		public Gtk.MenuShell	tools_menu;
		public Gtk.ProgressBar	progressbar;
	}
	[CCode (lower_case_cprefix = "msgwin_", cprefix = "msgwin_")]
	namespace Msgwin {
		[PrintfFormat]
		public void		status_add (string format, ...);
		[PrintfFormat]
		public void		compiler_add (int msg_color, string format, ...);
		[PrintfFormat]
		public void		msg_add (int msg_color, int line, Document *doc, string format, ...);
		public void		clear_tab (int tabnum);
		public void		switch_tab (int tabnum, bool show);
	}
	[CCode (cprefix = "navqueue_")]
	namespace Navqueue {
		public bool		goto_line (Document old_doc, Document new_doc, int line);
	}
	[Compact]
	[CCode (cprefix = "plugin_")]
	public class Plugin {
		[CCode (cname = "PluginInfo")]
		public struct Info {
			public unowned string name;
			public unowned string description;
			public unowned string version;
			public unowned string author;
			
			[CCode (cname = "__geany_vala_plugin_SET_INFO")]
			public void @set (string name, string? description, string? version, string? author)
			{
				this.name			= name;
				this.description	= description;
				this.version		= version;
				this.author			= author;
			}
		}
		[CCode (cname = "PluginCallback")]
		public struct Callback {
			public unowned string	signal_name;
			public GLib.Callback	@callback;
			public bool				after;
			public void				*user_data;
		}
		[CCode (cname = "PluginFields")]
		public struct Fields {
			public Flags		flags;
			public Gtk.MenuItem	menu_item;
		}
		[CCode (cname = "PluginFlags")]
		public enum Flags {
			[CCode (cname = "GEANY_IS_DOCUMENT_SENSITIVE")]
			IS_DOCUMENT_SENSITIVE
		}
		
		[CCode (cname = "__geany_vala_plugin_VERSION_CHECK")]
		public static int version_check (int abi_version, int api_required) {
			if (abi_version != ABI_VERSION)
				return -1;
			if (API_VERSION < (api_required))
				return (api_required);
			return 0;
		}
		
		[CCode (cname = "GEANY_API_VERSION")]
		static int API_VERSION;
		[CCode (cname = "GEANY_ABI_VERSION")]
		static int ABI_VERSION;
		
		public Info info;
		
		public void		add_toolbar_item (Gtk.ToolItem item);
		public void		module_make_resident ();
		public void		signal_connect (GLib.Object object, string signal_name, bool after,
										GLib.Callback cb, void *user_data);
		public KeyGroup	set_key_group (string section_name, size_t count, KeyGroupCallback cb);
		public void		show_configure ();
	}
	[Compact]
	[CCode (cname = "GeanyProject")]
	public class Project {
		public string	name;
		public string	description;
		public string	file_name;
		public string	base_path;
		public int		type;
		public string[]	file_patterns;
	}
	[CCode (cname = "ScintillaObject", cprefix = "scintilla_")]
	public class Scintilla : Gtk.Container {
		[CCode (cprefix = "SCI_")]
		public enum Message {
			GETEOLMODE,
			LINEDELETE
		}
		[CCode (cprefix = "SC_EOL_")]
		public enum EolMode {
			LF,
			CR,
			CRLF
		}
		
		public Scintilla ();
		public long		send_message (uint iMessage, ulong wParam = 0, ulong lParam = 0);
	}
	[CCode (cname = "ScintillaObject", cprefix = "sci_")]
	public class Sci : Scintilla {
		public struct TextToFind {
		}
		
		public void				send_command (int cmd);
		public void				start_undo_action ();
		public void				end_undo_action ();
		public void				set_text (string text);
		public void 			insert_text (int pos, string text);
		public int				get_length ();
		public int				get_current_position ();
		public void				set_current_position (int position, bool scroll_to_caret);
		public int				get_col_from_position (int position);
		public int				get_line_from_position (int position);
		public int				get_position_from_line (int line);
		public void				replace_sel (string text);
		public void				get_selected_text (string text);
		public int				get_selected_text_length ();
		public int				get_selection_start ();
		public int				get_selection_end ();
		public int				get_selection_mode ();
		public void				set_selection_mode (int mode);
		public void				set_selection_start (int position);
		public void				set_selection_end (int position);
		/* make get_line() take an optional second parameter to choose whether
		 * to include the EOL character */
		[CCode (cname = "sci_get_line")]
		private string			__get_line_with_eol (int line_num);
		[CCode (cname = "__geany_vala_plugin_sci_get_line")]
		public string get_line (int line_num, bool include_eol = true)
		{
			if (include_eol) {
				return this.__get_line_with_eol (line_num);
			} else {
				return this.get_contents_range (this.get_position_from_line (line_num),
												this.get_line_end_position (line_num));
			}
		}
		public int				get_line_length (int line);
		public int				get_line_count ();
		public bool				get_line_is_visible (int line);
		public void				ensure_line_is_visible (int line);
		public void				scroll_caret ();
		public int				find_matching_brace (int pos);
		public int				get_style_at (int position);
		public char				get_char_at (int pos);
		public int				get_current_line ();
		public bool				has_selection ();
		public int				get_tab_width ();
		public void				indicator_clear (int start, int end);
		public void				indicator_set (int indic);
		public string			get_contents (int len);
		public string			get_contents_range (int start, int end);
		public string			get_selection_contents ();
		public void				set_font (int style, string font, int size);
		public int				get_line_end_position (int line);
		public void				set_target_start (int start);
		public void				set_target_end (int end);
		public int				replace_target (string text, bool regex);
		public void				set_marker_at_line (int line_number, int marker);
		public void				delete_marker_at_line (int line_number, int marker);
		public bool				is_marker_set_at_line (int line, int marker);
		public void				goto_line (int line, bool unfold);
		public int				find_text (int flags, TextToFind ttf);
		public void				set_line_indentation (int line, int indent);
		public int				get_line_indentation (int line);
		/* these ones aren't exported in the plugin API or doesn't exist at all */
		[CCode (cname = "__geany_vala_plugin_sci_get_eol_mode")]
		public int get_eol_mode ()
		{
			return (int)this.send_message (Scintilla.Message.GETEOLMODE);
		}
		[CCode (cname = "__geany_vala_plugin_sci_get_eol_char_len")]
		public int get_eol_char_len ()
		{
			switch (this.get_eol_mode ())
			{
				case EolMode.CRLF:	return 2;
				default:			return 1;
			}
		}
	}
	[CCode (cprefix = "search_")]
	namespace Search {
		public void		show_find_in_files_dialog (string dir);
	}
	[Compact]
	[CCode (cname = "StashGroup", cprefix = "stash_group_", free_function = "stash_group_free")]
	public class StashGroup {
		public StashGroup (string name);
		
		public void		add_boolean (ref bool setting, string key_name, bool default_value);
		public void		add_integer (ref int setting, string key_name, int default_value);
		public void		add_string (ref string setting, string key_name, string default_value);
		public void		add_string_vector (ref string[] setting, string key_name, string[]? default_value);
		public void		load_from_key_file (GLib.KeyFile keyfile);
		public void		save_to_key_file (GLib.KeyFile keyfile);
		public bool		load_from_file (string filename);
		public int		save_to_file (string filename, GLib.KeyFileFlags flags);
		public void		add_toggle_button (ref bool setting, string key_name, bool default_value, void *widget_id);
		public void		add_radio_buttons (ref int setting, string key_name, int default_value, void *widget_id, int enum_id, ...);
		public void		add_spin_button_integer (ref int setting, string key_name, int default_value, void *widget_id);
		public void		add_combo_box (ref int setting, string key_name, int default_value, void *widget_id);
		public void		add_combo_box_entry (ref string setting, string key_name, string default_value, void *widget_id);
		public void		add_entry (ref string setting, string key_name, string default_value, void *widget_id);
		public void		add_widget_property (ref void *setting, string key_name, void *default_value, void *widget_id,
											 string property_name, GLib.Type type);
		public void		display (Gtk.Widget owner);
		public void		update (Gtk.Widget owner);
	}
	[CCode (cprefix = "symbols_")]
	namespace Symbols {
		public unowned string	get_context_separator (FiletypeID ft_id);
	}
	[CCode (cprefix = "templates_")]
	namespace Templates {
		public string	get_template_fileheader (int filetype_idx, string fname);
	}
	[CCode (cprefix = "tm_")]
	namespace TagManager {
		[CCode (cname = "TMWorkObject")]
		public struct WorkObject {
		}
		public struct Workspace {
		}
		[SimpleType]
		[IntegerType]
		public struct langType : int {
		}
		
		public string		get_real_path (string file_name);
		public WorkObject	source_file_new (string file_name, bool update, string name);
		public bool			workspace_add_object (WorkObject work_object);
		public bool			source_file_update (WorkObject source_file, bool force, bool recurse, bool update_parent);
		public void			work_object_free (void *work_object);
		public bool			workspace_remove_object (WorkObject w, bool do_free, bool update);
	}
	[CCode (cprefix = "ui_", lower_case_cprefix = "ui_")]
	namespace Ui {
		public class Button : Gtk.Button {
			public Button.with_image (string stock_id, string text);
		}
		public class ImageMenuItem : Gtk.ImageMenuItem {
			public ImageMenuItem (string stock_id, string label);
		}
		public class PathBox : Gtk.HBox {
			public PathBox (string title, Gtk.FileChooserAction action, Gtk.Entry entry);
		}
		public class DialogVBox : Gtk.VBox {
			public DialogVBox (Gtk.Dialog dialog);
		}
		
		/*public Gtk.Widget			dialog_vbox_new (Gtk.Dialog dialog);*/
		public Gtk.Widget			frame_new_with_alignment (string label_text, out Gtk.Widget alignment);
		[PrintfFormat]
		public void					set_statusbar (bool log, string format, ...);
		public void					table_add_row (Gtk.Table *table, int row, ...);
		/*public Gtk.Widget			path_box_new (string title, Gtk.FileChooserAction action, Gtk.Entry entry);*/
		/*public Gtk.Widget			button_new_with_image (string stock_id, string text);*/
		public void					add_document_sensitive (Gtk.Widget widget);
		public void					widget_set_tooltip_text (Gtk.Widget widget, string text);
		/*public Gtk.Widget			image_menu_item_new (string stock_id, string label);*/
		public unowned Gtk.Widget?	lookup_widget (Gtk.Widget widget, string widget_name);
		public void					progress_bar_start (string text);
		public void					progress_bar_stop ();
		public void					entry_add_clear_icon (Gtk.Entry entry);
		public void					menu_add_document_items (Gtk.Menu menu, Document active, GLib.Callback cb);
		public void					widget_modify_font_from_string (Gtk.Widget widget, string str);
		public bool					is_keyval_enter_or_return (uint keyval);
		public int					get_gtk_settings_integer (string property_name, int default_value);
	}
	[CCode (cprefix = "utils_", lower_case_cprefix = "utils_")]
	namespace Utils {
		/* str_equal -> no need, Vala support == */
		public uint					string_replace_all (GLib.StringBuilder haystack, string needle, string replacement);
		public GLib.SList<string>	get_file_list (string path, uint length)
			throws GLib.Error;
		public int					write_file (string filename, string text);
		public string				get_locale_from_utf8 (string utf8_text);
		public string				get_utf8_from_locale (string locale_text);
		public string				remove_ext_from_filename (string filename);
		public int					mkdir (string path, bool create_parent_dirs);
		public bool					get_setting_boolean (GLib.KeyFile config, string section, string key, bool default_value);
		public int					get_setting_integer (GLib.KeyFile config, string section, string key, int default_value);
		public string				get_setting_string (GLib.KeyFile config, string section, string key, string default_value);
		public bool					spawn_sync (string dir,
												[CCode (array_length = false, array_null_terminated = true)] string[] argv,
												[CCode (array_length = false, array_null_terminated = true)] string[]? env,
												GLib.SpawnFlags flags,
												GLib.SpawnChildSetupFunc? child_setup = null,
												void *user_data = null, out string std_out = null,
												out string std_err = null, out int exit_status = null)
			throws GLib.Error;
		public bool					spawn_async (string dir,
												 [CCode (array_length = false, array_null_terminated = true)] string[] argv,
												 [CCode (array_length = false, array_null_terminated = true)] string[]? env,
												 GLib.SpawnFlags flags,
												 GLib.SpawnChildSetupFunc? child_setup = null,
												 void *user_data = null,
												 out GLib.Pid child_pid = null)
			throws GLib.Error;
		public int					str_casecmp (string s1, string s2);
		public string				get_date_time (string format, ref time_t time_to_use);
		public void					open_browser (string uri);
		public uint					string_replace_first (GLib.StringBuilder haystack, string needle, string replace);
		public string				str_middle_truncate (string str, uint truncate_length);
		public string				str_remove_chars (owned string str, string chars);
		public GLib.SList<string>	get_file_list_full (string path, bool full_path, bool sort)
			throws GLib.Error;
		public string[]				copy_environment ([CCode (array_length = false, array_null_terminated = true)] string[]? exclude_vars,
													  string first_varname, ...);
	}
	[CCode (cname = "GeanyIndentType", cprefix = "GEANY_INDENT_TYPE_")]
	public enum IndentType {
		SPACES,
		TABS,
		BOTH
	}
	[CCode (cname = "GeanyAutoIndent", cprefix = "GEANY_AUTOINDENT_")]
	public enum AutoIndent {
		NONE,
		BASIC,
		CURRENTCHARS,
		MATCHBRACES
	}
	[CCode (cname = "GeanyVirtualSpace", cprefix = "GEANY_VIRTUAL_SPACE_")]
	public enum VirtualSpace {
		DISABLED,
		GEANY_VIRTUAL_SPACE_SELECTION,
		GEANY_VIRTUAL_SPACE_ALWAYS
	}
}
