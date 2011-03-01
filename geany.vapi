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
	/* reviewed */
	[Compact]
	public class App {
		public bool								debug_mode;
		[CCode (cname = "configdir")]
		public string							config_dir;
		[CCode (cname = "datadir")]
		public string							data_dir;
		[CCode (cname = "docdir")]
		public string							doc_dir;
		public unowned TagManager.Workspace		tm_workspace;
		public Project?							project;
	}
	/* reviewed */
	[Compact]
	public class InterfacePrefs {
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
		public bool		use_native_windows_dialogs; /* only used on Windows */
		public bool		compiler_tab_autoscroll;
	}
	/* reviewed */
	[Compact]
	public class IndentPrefs {
		public int			width;
		public IndentType	type;
		public int			hard_tab_width;
		public AutoIndent	auto_indent_mode;
		public bool			detect_type;
	}
	/* reviewed */
	[Compact]
	public class EditorPrefs {
		public IndentPrefs	indentation;
		public bool			show_white_space;
		public bool			show_indent_guide;
		public bool			show_line_endings;
		public int			long_line_type;
		public int			long_line_column;
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
		public bool			long_line_enabled;
	}
	/* reviewed */
	[Compact]
	public class ToolbarPrefs {
		public bool				visible;
		public Gtk.IconSize		icon_size;
		public Gtk.ToolbarStyle	icon_style;
		public bool				use_gtk_default_style;
		public bool				use_gtk_default_icon;
		public bool				append_to_menu;
	}
	/* reviewed */
	[Compact]
	public class Prefs {
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
	/* reviewed */
	[Compact]
	public class ToolPrefs {
		public string	browser_cmd;
		public string	term_cmd;
		public string	grep_cmd;
		public string	context_action_cmd;
	}
	/* reviewed */
	[CCode (cname = "GeanyFindSelOptions", cprefix = "GEANY_FIND_SEL_", has_type_id = false)]
	public enum FindSelectionType {
		CURRENT_WORD,
		SEL_X,
		AGAIN
	}
	/* reviewed */
	[Compact]
	public class SearchPrefs {
		public bool					suppress_dialogs;
		public bool					use_current_word;
		public bool					use_current_file_dir;
		public FindSelectionType	find_selection_type;
	}
	/* reviewed
	 * FIXME: are (some of) these nullable? */
	[Compact]
	public class TemplatePrefs {
		public string	developer;
		public string	company;
		public string	mail;
		public string	initials;
		public string	version;
		public string	year_format;
		public string	date_format;
		public string	datetime_format;
	}
	/* reviewed */
	[Compact]
	public class FilePrefs {
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
		public bool		ensure_convert_new_lines;
		public bool		gio_unsafe_save_backup;
	}
	/* reviewed */
	[CCode (cprefix = "GEANY_GBG_", has_type_id = false)]
	public enum BuildGroup {
		FT,			/* *< filetype items */
		NON_FT,		/* *< non filetype items.*/
		EXEC,		/* *< execute items */
		COUNT		/* *< count of groups. */
	}
	/* reviewed */
	[Compact]
	public class BuildInfo {
		[CCode (cname = "grp")]
		BuildGroup		group;
		[CCode (cname = "cmd")]
		int				command;
		GLib.Pid		pid;	/* id of the spawned process */
		string			dir;
		uint			file_type_id;
		string			custom_target;
		int				message_count;
	}
	/* reviewed */
	[Compact]
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
	/* reviewed */
	[CCode (cprefix = "dialogs_")]
	namespace Dialogs {
		public string?	show_input (string title, Gtk.Window parent,
									string? label_text = null, string? default_text = null);
		public bool		show_input_numeric (string title, string label_text,
											ref double value, double min, double max, double step);
		[PrintfFormat]
		public void		show_msgbox (Gtk.MessageType type, string text, ...);
		[PrintfFormat]
		public bool		show_question (string text, ...);
		public bool		show_save_as ();
	}
	/* reviewed */
	[Compact]
	[CCode (cname = "struct GeanyDocument",
			cprefix = "document_",
			free_function = "document_close")]
	public class Document {
		public bool						changed;
		public Editor					editor;
		public string					encoding;
		public string?					file_name;
		public Filetype					file_type;
		public bool						has_bom;
		public bool						has_tags;
		public int						index;
		public bool						readonly;
		public string?					real_path;
		public TagManager.WorkObject?	tm_file;
		public bool 					valid {
			[CCode (cname = "DOC_VALID")]
			get;
		}
		
		[CCode (cname = "DOC_FILENAME")]
		public unowned string 			get_filename ();
		[Deprecated (replacement = "Geany.Document.valid")]
		[CCode (cname = "DOC_VALID")]
		public bool 					is_valid ();
		
		public bool						close ();
		public static unowned Document?	find_by_filename (string utf8_filename);
		public static unowned Document?	find_by_real_path (string realname);
		public string					get_basename_for_display (int length);
		public static unowned Document?	get_current ();
		public static unowned Document?	get_from_page (uint page_num);
		public int						get_notebook_page ();
		public unowned Gdk.Color?		get_status_color ();
		[CCode (cname = "document_index")]
		public static unowned Document?	get_index (int idx);
		public static unowned Document	new_file (string? utf8_filename = null, Filetype? ft = null,
												  string? text = null);
		public static unowned Document?	open_file (string locale_filename, bool readonly = false,
												   Filetype? ft = null, string? forced_enc = null);
		public static void				open_files (GLib.SList filenames, bool readonly = false,
													Filetype? ft = null, string? forced_enc = null);
		public bool						reload_file (string? forced_enc = null);
		public static bool				remove_page (uint page_num);
		public void						rename_file (string new_filename);
		public bool						save_file (bool force = false);
		public bool						save_file_as (string? utf8_fname = null);
		public void						set_encoding (string new_encoding);
		public void						set_filetype (Filetype type);
		public void						set_text_changed (bool changed);
	}
	/* reviewed */
	[CCode (cname = "documents", array_length_cexpr = "GEANY(documents_array)->len")]
	public static unowned Document[]	documents;
	/* reviewed */
	[CCode (cprefix = "GEANY_INDICATOR_", has_type_id = false)]
	public enum Indicator {
		ERROR,
		SEARCH
	}
	/* reviewed */
	[Compact]
	[CCode (cname = "struct GeanyEditor", cprefix = "editor_")]
	public class Editor {
		public bool			auto_indent;
		public Document		document;
		public int			indent_width;
		public bool			line_breaking;
		public bool			line_wrapping;
		public Sci			sci;
		public float		scroll_percent;

		[CCode (cname = "GEANY_WORDCHARS")]
		public static unowned string		wordchars;

		public Sci							create_widget ();
		public static unowned string?		find_snippet (Editor? editor, string snippet_name);
		public static unowned string		get_eol_char (Editor? editor = null);
		public static int					get_eol_char_len (Editor? editor = null);
		public static unowned string		get_eol_char_name (Editor? editor = null);
		public static unowned IndentPrefs	get_indent_prefs (Editor? editor = null);
		public string?						get_word_at_pos (int pos, string? wordchars = null);
		public bool							goto_pos (int pos, bool mark = false);
		public void							indicator_clear (Indicator indic);
		public void							indicator_set_on_line (Indicator indic, int line);
		public void							indicator_set_on_range (Indicator indic, int start, int end);
		public void							insert_snipped (int pos, string snippet);
		public void							insert_text_block (string text, int insert_pos,
															   int cursor_index = -1,
															   int newline_indent_size = -1,
															   bool replace_newlines = true);
		public void							set_indent_type (IndentType type);
	}
	/* reviewed */
	[CCode (cname = "GeanyEncodingIndex", cprefix = "GEANY_ENCODING_", has_type_id = false)]
	public enum EncodingID {
		ISO_8859_1,
		ISO_8859_2,
		ISO_8859_3,
		ISO_8859_4,
		ISO_8859_5,
		ISO_8859_6,
		ISO_8859_7,
		ISO_8859_8,
		ISO_8859_8_I,
		ISO_8859_9,
		ISO_8859_10,
		ISO_8859_13,
		ISO_8859_14,
		ISO_8859_15,
		ISO_8859_16,

		UTF_7,
		UTF_8,
		UTF_16LE,
		UTF_16BE,
		UCS_2LE,
		UCS_2BE,
		UTF_32LE,
		UTF_32BE,

		ARMSCII_8,
		BIG5,
		BIG5_HKSCS,
		CP_866,

		EUC_JP,
		EUC_KR,
		EUC_TW,

		GB18030,
		GB2312,
		GBK,
		GEOSTD8,
		HZ,

		IBM_850,
		IBM_852,
		IBM_855,
		IBM_857,
		IBM_862,
		IBM_864,

		ISO_2022_JP,
		ISO_2022_KR,
		ISO_IR_111,
		JOHAB,
		KOI8_R,
		KOI8_U,

		SHIFT_JIS,
		TCVN,
		TIS_620,
		UHC,
		VISCII,

		WINDOWS_1250,
		WINDOWS_1251,
		WINDOWS_1252,
		WINDOWS_1253,
		WINDOWS_1254,
		WINDOWS_1255,
		WINDOWS_1256,
		WINDOWS_1257,
		WINDOWS_1258,

		NONE,
		CP_932
	}
	/* reviewed */
	[Compact]
	[CCode (cprefix = "encodings_")]
	public class Encoding {
		[CCode (cname = "idx")]
		public EncodingID				index;
		public unowned string			charset;
		public unowned string			name;
		
		public static string?			convert_to_utf8 (string buffer, size_t size,
														 out string used_encoding = null);
		public static string?			convert_to_utf8_from_charset (string buffer, size_t size,
																	  string charset, bool fast);
		public static unowned string?	get_charset_from_index (EncodingID idx);
	}
	/* reviewed */
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
		FORTH,
		LISP,
		ERLANG,
		COBOL,
		/* ^ append items here */
		[CCode (cname = "GEANY_MAX_BUILT_IN_FILETYPES")]
		MAX_BUILT_IN_FILETYPES
	}
	/* reviewed */
	[CCode (cprefix = "GEANY_FILETYPE_GROUP_", has_type_id = false)]
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
	/* reviewed */
	[Compact]
	[CCode (cname = "struct GeanyFiletype", cprefix = "filetypes_")]
	public class Filetype {
		public string					context_action_cmd;
		public string?					comment_close;
		public string?					comment_open;
		public bool						comment_use_indent;
		public string?					error_regex_string;

		public string?					extension;
		public FiletypeGroupID			group;
		public Gdk.Pixbuf?				icon;
		public FiletypeID				id;
		public TagManager.langType		lang;
		public Filetype					lexer_filetype;
		public string?					mime_type;
		public string					name;
		[CCode (array_length = false, array_null_terminated = true)]
		public string[]					pattern;
		public string					title;
		
		public static unowned Filetype	detect_from_file (string utf8_filename);
		public unowned string			get_display_name ();
		public static unowned Filetype?	index (int idx);
		public static unowned Filetype?	lookup_by_name (string name);
	}
	/* reviewed */
	[CCode (cname = "filetypes", array_length_cexpr = "GEANY(filetypes_array)->len")]
	public unowned Filetype[] filetypes;
	/* reviewed */
	[CCode (cname = "filetypes_by_title")]
	public GLib.SList<Filetype> filetypes_by_title;
	/* reviewed */
	[Compact]
	public class Functions {
		/* No need to fill-in, the functions are wrapped.
		 * However, the plugins needs to define geany_functions with this type,
		 * so we need to have it here. */
	}
	/* reviewed */
	[CCode (cprefix = "highlighting_")]
	namespace Highlighting {
		public unowned LexerStyle	get_style (int ft_id, int style_id);
		public bool					is_code_style (int lexer, int style);
		public bool					is_comment_style (int lexer, int style);
		public bool					is_string_style (int lexer, int style);
		public void					set_styles (Sci sci, Filetype ft);
	}
	/* reviewed */
	public delegate void KeyCallback (uint key_id);
	/* reviewed */
	[CCode (has_type_id = false)]
	public struct KeyBinding {
		public KeyCallback		@callback;
		public uint				key;
		public string 			label;
		public Gtk.Widget?		menu_item;
		public Gdk.ModifierType	mods;
		public string 			name;
	}
	/* reviewed */
	[CCode (cprefix = "keybindings_")]
	namespace Keybindings {
		public unowned KeyBinding	get_item (KeyGroup group, size_t key_id);
		public void					send_command (KeyGroupID group_id, KeyBindingID key_id);
		public unowned KeyBinding	set_item (KeyGroup group, size_t key_id, KeyCallback? cb,
											  uint key, Gdk.ModifierType mod, string kf_name,
											  string label, Gtk.Widget? menu_item = null);
	}
	/* reviewed */
	[CCode (has_type_id = false)]
	public struct KeyGroup {}
	/* reviewed */
	public delegate bool KeyGroupCallback (uint key_id);
	/* reviewed */
	[CCode (cprefix = "GEANY_KEYS_", has_type_id = false)]
	public enum KeyBindingID {
		EDITOR_TRANSPOSELINE,
		DOCUMENT_REMOVE_ERROR_INDICATORS,
		FOCUS_SEARCHBAR,
		SEARCH_FIND,
		FILE_SAVEALL,
		GOTO_NEXTMARKER,
		NOTEBOOK_SWITCHTABLEFT,
		VIEW_ZOOMOUT,
		GOTO_LINE,
		DOCUMENT_TOGGLEFOLD,
		BUILD_COMPILE,
		EDITOR_SCROLLTOLINE,
		DOCUMENT_UNFOLDALL,
		GOTO_MATCHINGBRACE,
		SEARCH_FINDDOCUMENTUSAGE,
		CLIPBOARD_PASTE,
		BUILD_MAKE,
		INSERT_ALTWHITESPACE,
		EDITOR_SCROLLLINEDOWN,
		VIEW_TOGGLEALL,
		VIEW_FULLSCREEN,
		GOTO_LINEEND,
		EDITOR_CALLTIP,
		FILE_PRINT,
		EDITOR_DUPLICATELINE,
		FOCUS_SCRIBBLE,
		TOOLS_OPENCOLORCHOOSER,
		SEARCH_PREVIOUSMESSAGE,
		FILE_CLOSE,
		DOCUMENT_REPLACETABS,
		FILE_RELOAD,
		SEARCH_FINDNEXTSEL,
		FOCUS_MESSAGES,
		BUILD_RUN,
		HELP_HELP,
		SETTINGS_PLUGINPREFERENCES,
		VIEW_ZOOMRESET,
		SELECT_WORD,
		FORMAT_INCREASEINDENT,
		SETTINGS_PREFERENCES,
		FORMAT_SENDTOCMD3,
		DOCUMENT_FOLDALL,
		FORMAT_SENDTOVTE,
		PROJECT_PROPERTIES,
		DOCUMENT_LINEWRAP,
		EDITOR_MACROLIST,
		EDITOR_SUPPRESSSNIPPETCOMPLETION,
		FOCUS_SIDEBAR_SYMBOL_LIST,
		GOTO_LINESTART,
		SEARCH_FINDUSAGE,
		FILE_NEW,
		EDITOR_SNIPPETNEXTCURSOR,
		NOTEBOOK_SWITCHTABRIGHT,
		FILE_SAVE,
		FORMAT_INCREASEINDENTBYSPACE,
		SEARCH_FINDNEXT,
		GOTO_TOGGLEMARKER,
		GOTO_TAGDEFINITION,
		SEARCH_NEXTMESSAGE,
		EDITOR_DELETELINETOEND,
		FORMAT_AUTOINDENT,
		FILE_OPENSELECTED,
		GOTO_BACK,
		INSERT_DATE,
		BUILD_PREVIOUSERROR,
		GOTO_LINEENDVISUAL,
		DOCUMENT_REPLACESPACES,
		FOCUS_EDITOR,
		SELECT_WORDPARTRIGHT,
		VIEW_MESSAGEWINDOW,
		FOCUS_SIDEBAR_DOCUMENT_LIST,
		FORMAT_REFLOWPARAGRAPH,
		EDITOR_MOVELINEUP,
		NOTEBOOK_MOVETABLEFT,
		SELECT_LINE,
		EDITOR_UNDO,
		EDITOR_MOVELINEDOWN,
		CLIPBOARD_COPYLINE,
		BUILD_MAKEOWNTARGET,
		FORMAT_SENDTOCMD2,
		SEARCH_MARKALL,
		BUILD_LINK,
		FILE_CLOSEALL,
		GOTO_FORWARD,
		CLIPBOARD_CUT,
		NOTEBOOK_SWITCHTABLASTUSED,
		NOTEBOOK_MOVETABRIGHT,
		BUILD_OPTIONS,
		GOTO_TAGDECLARATION,
		FILE_OPEN,
		EDITOR_COMPLETESNIPPET,
		FORMAT_UNCOMMENTLINE,
		FOCUS_VTE,
		FORMAT_SENDTOCMD1,
		SELECT_WORDPARTLEFT,
		VIEW_ZOOMIN,
		DOCUMENT_LINEBREAK,
		EDITOR_REDO,
		EDITOR_CONTEXTACTION,
		SEARCH_FINDPREVSEL,
		FORMAT_DECREASEINDENTBYSPACE,
		FORMAT_COMMENTLINETOGGLE,
		SELECT_ALL,
		DOCUMENT_RELOADTAGLIST,
		BUILD_NEXTERROR,
		NOTEBOOK_MOVETABLAST,
		SELECT_PARAGRAPH,
		EDITOR_DELETELINE,
		CLIPBOARD_COPY,
		VIEW_SIDEBAR,
		FILE_SAVEAS,
		FORMAT_COMMENTLINE,
		GOTO_PREVWORDPART,
		SEARCH_FINDPREVIOUS,
		SEARCH_REPLACE,
		EDITOR_WORDPARTCOMPLETION,
		EDITOR_AUTOCOMPLETE,
		FOCUS_SIDEBAR,
		FOCUS_MESSAGE_WINDOW,
		NOTEBOOK_MOVETABFIRST,
		GOTO_PREVIOUSMARKER,
		EDITOR_SCROLLLINEUP,
		FOCUS_COMPILER,
		FORMAT_TOGGLECASE,
		CLIPBOARD_CUTLINE,
		DOCUMENT_REMOVE_MARKERS,
		BUILD_MAKEOBJECT,
		FORMAT_DECREASEINDENT,
		FILE_OPENLASTTAB,
		SEARCH_FINDINFILES,
		GOTO_NEXTWORDPART,
		INSERT_LINEAFTER,
		INSERT_LINEBEFORE
	}
	/* reviewed */
	[CCode (cprefix = "GEANY_KEY_GROUP_", has_type_id = false)]
	public enum KeyGroupID {
		FILE,
		PROJECT,
		EDITOR,
		CLIPBOARD,
		SELECT,
		FORMAT,
		INSERT,
		SETTINGS,
		SEARCH,
		GOTO,
		VIEW,
		FOCUS,
		NOTEBOOK,
		DOCUMENT,
		BUILD,
		TOOLS,
		HELP
	}
	/* reviewed */
	[Compact]
	public class LexerStyle {
		public int	foreground;
		public int	background;
		public bool	bold;
		public bool	italic;
	}
	/* reviewed */
	[CCode (cprefix = "main_")]
	namespace Main {
		public void		reload_configuration ();
		public void		locale_init (string locale_dir, string package);
		public bool		is_realized ();
	}
	/* reviewed */
	[Compact]
	public class MainWidgets {
		public Gtk.MenuShell	editor_menu;
		public Gtk.Notebook		message_window_notebook;
		public Gtk.Notebook		notebook;
		public Gtk.ProgressBar	progressbar;
		public Gtk.MenuShell	project_menu;
		public Gtk.Notebook		sidebar_notebook;
		public Gtk.Toolbar		toolbar;
		public Gtk.MenuShell	tools_menu;
		public Gtk.Window		window;
	}
	/* reviewed */
	[CCode (lower_case_cprefix = "msgwin_", cprefix = "msgwin_")]
	namespace MessageWindow {
		[CCode (cname = "MessageWindowTabNum", has_type_id = false)]
		public enum TabID {
			STATUS,
			COMPILER,
			MESSAGE,
			SCRATCH,
			VTE
		}
		[CCode (cname = "MsgColors", has_type_id = false)]
		public enum Color {
			RED,
			DARK_RED,
			BLACK,
			BLUE
		}

		public void		clear_tab (MessageWindow.TabID tabnum);
		[PrintfFormat]
		public void		compiler_add (MessageWindow.Color msg_color, string format, ...);
		[PrintfFormat]
		public void		msg_add (MessageWindow.Color msg_color, int line, Document? doc, string format, ...);
		[PrintfFormat]
		public void		set_messages_dir (string messages_dir);
		public void		status_add (string format, ...);
		public void		switch_tab (MessageWindow.TabID tabnum, bool show);
	}
	/* reviewed */
	[CCode (cprefix = "navqueue_")]
	namespace NavQueue {
		public bool		goto_line (Document? old_doc, Document new_doc, int line);
	}
	/* reviewed */
	[Compact]
	[CCode (cprefix = "plugin_")]
	public class Plugin {
		[Compact]
		[CCode (cname = "PluginInfo")]
		public class Info {
			public unowned string name;
			public unowned string? description;
			public unowned string? version;
			public unowned string? author;
			
			[CCode (cname = "__geany_vala_plugin_SET_INFO")]
			public void @set (string name, string? description, string? version, string? author)
			{
				this.name			= name;
				this.description	= description;
				this.version		= version;
				this.author			= author;
			}
		}
		[Compact]
		[CCode (cname = "PluginCallback")]
		public class Callback {
			public unowned string	signal_name;
			public GLib.Callback	@callback;
			public bool				after;
			public void				*user_data;
		}
		[Compact]
		[Deprecated (replacement = "Ui.add_document_sensitive()")]
		[CCode (cname = "PluginFields")]
		public class Fields {
			public Flags		flags;
			public Gtk.MenuItem	menu_item;
		}
		[Deprecated (replacement = "Ui.add_document_sensitive()")]
		[CCode (cname = "PluginFlags", has_type_id = false)]
		public enum Flags {
			[CCode (cname = "GEANY_IS_DOCUMENT_SENSITIVE")]
			IS_DOCUMENT_SENSITIVE
		}
		
		[CCode (cname = "__geany_vala_plugin_VERSION_CHECK")]
		public static int version_check (int abi_version, int api_required) {
			/* drop-in copy of GEANY_VERSION_CHECK() macro */
			if (abi_version != ABI_VERSION)
				return -1;
			return (api_required);
		}
		
		[CCode (cname = "GEANY_API_VERSION")]
		static int API_VERSION;
		[CCode (cname = "GEANY_ABI_VERSION")]
		static int ABI_VERSION;
		
		public Info info;
		
		public void		add_toolbar_item (Gtk.ToolItem item);
		public void		module_make_resident ();
		public void		signal_connect (GLib.Object? object, string signal_name, bool after,
										GLib.Callback cb, void *user_data = null);
		public KeyGroup	set_key_group (string section_name, size_t count, KeyGroupCallback cb);
		public void		show_configure ();
	}
	/* reviewed */
	[Compact]
	public class Project {
		public string	base_path;
		public string	description;
		public string	file_name;
		[CCode (array_length = false, array_null_terminated = true)]
		public string[]	file_patterns;
		public string	name;
		public int		type;
	}
	/* TODO: switch to codebrainz's full wrapper */
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
	/* reviewed */
	/* TODO: use proper types for the argument when we get them (enums & co) */
	[CCode (cname = "ScintillaObject", cprefix = "sci_")]
	public class Sci : Scintilla {
		/* FIXME: we need this to be really implemented for find_text() to be usable */
		public struct TextToFind {
		}
		
		public void				delete_marker_at_line (int line_number, int marker);
		public void				end_undo_action ();
		public void				ensure_line_is_visible (int line);
		public int				find_matching_brace (int pos);
		public int				find_text (int flags, TextToFind ttf);
		public char				get_char_at (int pos);
		public int				get_col_from_position (int position);
		public string			get_contents (int len = this.get_length () + 1);
		public string			get_contents_range (int start, int end);
		public int				get_current_line ();
		public int				get_current_position ();
		public int				get_length ();
		/* make get_line() take an optional second parameter to choose whether
		 * to include the EOL character */
		[CCode (cname = "sci_get_line")]
		private string			__get_line_with_eol (int line_num);
		[CCode (cname = "__geany_vala_plugin_sci_get_line")]
		public string			get_line (int line_num, bool include_eol = true) {
			if (include_eol) {
				return this.__get_line_with_eol (line_num);
			} else {
				return this.get_contents_range (this.get_position_from_line (line_num),
												this.get_line_end_position (line_num));
			}
		}
		public int				get_line_count ();
		public int				get_line_end_position (int line);
		public int				get_line_from_position (int position);
		public int				get_line_indentation (int line);
		public bool				get_line_is_visible (int line);
		public int				get_line_length (int line);
		public int				get_position_from_line (int line);
		[Deprecated (replacement = "Geany.Sci.get_selection_contents")]
		public void				get_selected_text (string text);
		public int				get_selected_text_length ();
		public string			get_selection_contents ();
		public int				get_selection_end ();
		public int				get_selection_mode ();
		public int				get_selection_start ();
		public int				get_style_at (int position);
		public int				get_tab_width ();
		public void				goto_line (int line, bool unfold = true);
		public bool				has_selection ();
		public void				indicator_clear (int start, int end);
		public void				indicator_set (int indic);
		public void 			insert_text (int pos, string text);
		public bool				is_marker_set_at_line (int line, int marker);
		[CCode (cname = "sci_replace_sel")]
		public void				replace_selection (string text);
		public int				replace_target (string text, bool regex = false);
		public void				scroll_caret ();
		/* FIXME: maybe remove this since we have default values for send_message()? */
		[Deprecated (replacement = "Scintilla.send_message")]
		public void				send_command (int cmd);
		public void				set_current_position (int position, bool scroll_to_caret = true);
		public void				set_font (int style, string font, int size);
		public void				set_line_indentation (int line, int indent);
		public void				set_marker_at_line (int line_number, int marker);
		public void				set_selection_end (int position);
		public void				set_selection_mode (int mode);
		public void				set_selection_start (int position);
		public void				set_target_end (int end);
		public void				set_target_start (int start);
		public void				set_text (string text);
		public void				start_undo_action ();

		/* these ones aren't exported in the plugin API or doesn't exist at all */
		[CCode (cname = "__geany_vala_plugin_sci_get_eol_mode")]
		public int get_eol_mode () {
			return (int)this.send_message (Scintilla.Message.GETEOLMODE);
		}
		[CCode (cname = "__geany_vala_plugin_sci_get_eol_char_len")]
		public int get_eol_char_len () {
			switch (this.get_eol_mode ()) {
				case EolMode.CRLF:	return 2;
				default:			return 1;
			}
		}
	}
	/* reviewed */
	[CCode (cprefix = "search_")]
	namespace Search {
		public void		show_find_in_files_dialog (string? dir = null);
	}
	/* reviewed */
	[Compact]
	[CCode (cname = "StashGroup",
			cprefix = "stash_group_",
			free_function = "stash_group_free")]
	public class StashGroup {
		
		public StashGroup (string name);
		
		public void		add_boolean (ref bool setting, string key_name, bool default_value);
		public void		add_combo_box (ref int setting, string key_name, int default_value, void *widget_id);
		public void		add_combo_box_entry (ref string setting, string key_name, string default_value,
											 void *widget_id);
		public void		add_entry (ref string setting, string key_name, string default_value,
								   void *widget_id);
		public void		add_integer (ref int setting, string key_name, int default_value);
		public void		add_radio_buttons (ref int setting, string key_name, int default_value,
										   void *widget_id, int enum_id, ...);
		public void		add_spin_button_integer (ref int setting, string key_name, int default_value,
												 void *widget_id);
		public void		add_string (ref string setting, string key_name, string? default_value);
		public void		add_string_vector (ref string[] setting, string key_name, string[]? default_value);
		public void		add_toggle_button (ref bool setting, string key_name, bool default_value,
										   void *widget_id);
		public void		add_widget_property (void *setting, string key_name, void *default_value,
											 void *widget_id, string property_name, GLib.Type type);
		public void		display (Gtk.Widget? owner);
		public bool		load_from_file (string filename);
		public void		load_from_key_file (GLib.KeyFile keyfile);
		public int		save_to_file (string filename, GLib.KeyFileFlags flags = GLib.KeyFileFlags.NONE);
		public void		save_to_key_file (GLib.KeyFile keyfile);
		public void		update (Gtk.Widget? owner);
	}
	/* reviewed */
	[CCode (cprefix = "symbols_")]
	namespace Symbols {
		public unowned string	get_context_separator (FiletypeID ft_id);
	}
	/* reviewed */
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
	/* reviewed */
	[CCode (cprefix = "ui_", lower_case_cprefix = "ui_")]
	namespace Ui {
		[CCode (cname = "GtkButton", type_id = "GTK_TYPE_BUTTON")]
		public class Button : Gtk.Button {
			public Button.with_image (string stock_id, string text);
		}
		[CCode (cname = "GtkImageMenuItem", type_id = "GTK_TYPE_IMAGE_MENU_ITEM")]
		public class ImageMenuItem : Gtk.ImageMenuItem {
			public ImageMenuItem (string stock_id, string label);
		}
		[CCode (cname = "GtkHBox", type_id = "GTK_TYPE_HBOX")]
		public class PathBox : Gtk.HBox {
			public PathBox (string? title, Gtk.FileChooserAction action, Gtk.Entry entry);
		}
		[CCode (cname = "GtkVBox", type_id = "GTK_TYPE_VBOX")]
		public class DialogVBox : Gtk.VBox {
			public DialogVBox (Gtk.Dialog dialog);
		}
		[CCode (cname = "GtkFrame", type_id = "GTK_TYPE_FRAME")]
		public class Frame : Gtk.Frame {
			public Frame.with_alignment (string label_text, out Gtk.Alignment alignment);
		}
		
		public void					hookup_widget (Gtk.Widget owner, Gtk.Widget widget, string name);
		public void					add_document_sensitive (Gtk.Widget widget);
		/*public Gtk.Button			button_new_with_image (string stock_id, string text);*/
		public void					combo_box_add_to_history (Gtk.ComboBoxEntry combo_entry, string? text,
															  int history_len = 0);
		/*public Gtk.VBox			dialog_vbox_new (Gtk.Dialog dialog);*/
		public void					entry_add_clear_icon (Gtk.Entry entry);
		/*public Gtk.Frame			frame_new_with_alignment (string label_text, out Gtk.Alignment alignment);*/
		public int					get_gtk_settings_integer (string property_name, int default_value);
		/*public Gtk.ImageMenuItem	image_menu_item_new (string stock_id, string label);*/
		public bool					is_keyval_enter_or_return (uint keyval);
		public unowned Gtk.Widget?	lookup_widget (Gtk.Widget widget, string widget_name);
		public void					menu_add_document_items (Gtk.Menu menu, Document? active, GLib.Callback cb);
		/*public Gtk.HBox			path_box_new (string? title, Gtk.FileChooserAction action, Gtk.Entry entry);*/
		public void					progress_bar_start (string? text);
		public void					progress_bar_stop ();
		[PrintfFormat]
		public void					set_statusbar (bool log, string format, ...);
		public void					table_add_row (Gtk.Table table, int row, ...);
		public void					widget_modify_font_from_string (Gtk.Widget widget, string str);
		public void					widget_set_tooltip_text (Gtk.Widget widget, string text);
	}
	/* reviewed */
	[CCode (cprefix = "utils_", lower_case_cprefix = "utils_")]
	namespace Utils {
		[CCode (array_length = false, array_null_terminated = true)]
		public string[]				copy_environment ([CCode (array_length = false, array_null_terminated = true)]
													  string[]? exclude_vars, string first_varname, ...);
		public string?				find_open_xml_tag (string sel, int size);
		public string				get_date_time (string format, time_t? time_to_use = null);
		public GLib.SList<string>?	get_file_list (string path, out uint length = null) throws GLib.Error;
		public GLib.SList<string>?	get_file_list_full (string path, bool full_path = false, bool sort = false)
			throws GLib.Error;
		public string				get_locale_from_utf8 (string utf8_text);
		public bool					get_setting_boolean (GLib.KeyFile config, string section,
														 string key, bool default_value);
		public int					get_setting_integer (GLib.KeyFile config, string section,
														 string key, int default_value);
		public string				get_setting_string (GLib.KeyFile config, string section,
														string key, string default_value);
		public string				get_utf8_from_locale (string locale_text);
		public int					mkdir (string path, bool create_parent_dirs = true);
		public void					open_browser (string uri);
		public string				remove_ext_from_filename (string filename);
		public bool					spawn_async (string? dir,
												 [CCode (array_length = false, array_null_terminated = true)] string[] argv,
												 [CCode (array_length = false, array_null_terminated = true)] string[]? env = null,
												 GLib.SpawnFlags flags = 0, GLib.SpawnChildSetupFunc? child_setup = null,
												 out GLib.Pid child_pid = null) throws GLib.Error;
		public bool					spawn_sync (string? dir,
												[CCode (array_length = false, array_null_terminated = true)] string[] argv,
												[CCode (array_length = false, array_null_terminated = true)] string[]? env = null,
												GLib.SpawnFlags flags = 0, GLib.SpawnChildSetupFunc? child_setup = null,
												out string std_out = null, out string std_err = null,
												out int exit_status = null) throws GLib.Error;
		public int					str_casecmp (string? s1, string? s2);
		/* utils_str_equal() -> no need, Vala has "==" for this */
		public string				str_middle_truncate (string str, uint truncate_length);
		/* wrap str_remove_chars() to return a copy of the string to fit Vala's
		 * conventions, and because I can't find the right binding for all cases */
		[CCode (cname = "utils_str_remove_chars")]
		private unowned string		__str_remove_chars (string str, string chars);
		[CCode (cname = "__geany_vala_plugin_utils_str_remove_chars")]
		public string				str_remove_chars (string str, string chars) {
			var copy = str;
			__str_remove_chars (copy, chars);
			return copy;
		}
		public uint					string_replace_all (GLib.StringBuilder haystack, string needle, string replace);
		public uint					string_replace_first (GLib.StringBuilder haystack, string needle, string replace);
		public int					write_file (string filename, string text);
	}
	/* reviewed */
	[CCode (cprefix = "GEANY_INDENT_TYPE_", has_type_id = false)]
	public enum IndentType {
		SPACES,
		TABS,
		BOTH
	}
	/* reviewed */
	[CCode (cprefix = "GEANY_AUTOINDENT_", has_type_id = false)]
	public enum AutoIndent {
		NONE,
		BASIC,
		CURRENTCHARS,
		MATCHBRACES
	}
	/* reviewed */
	[CCode (cprefix = "GEANY_VIRTUAL_SPACE_", has_type_id = false)]
	public enum VirtualSpace {
		DISABLED,
		SELECTION,
		ALWAYS
	}
}
