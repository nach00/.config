local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

config = {
	default_cursor_style = "SteadyBar",

	colors = {
		-- The default text color
		foreground = "silver",
		-- The default background color
		background = "black",

		-- Overrides the cell background color when the current cell is occupied by the
		-- cursor and the cursor style is set to Block
		-- cursor_bg = '#52ad70',
		cursor_bg = "#8BA7A7",
		-- Overrides the text color when the current cell is occupied by the cursor
		-- cursor_fg = 'black',
		cursor_fg = "#282A36",
		-- Specifies the border color of the cursor when the cursor style is set to Block,
		-- or the color of the vertical or horizontal bar when the cursor style is set to
		-- Bar or Underline.
		cursor_border = "#8BA7A7",
		-- cursor_border = '#52ad70',

		-- the foreground color of selected text
		selection_fg = "black",
		-- the background color of selected text
		selection_bg = "#fffacd",

		-- The color of the scrollbar "thumb"; the portion that represents the current viewport
		scrollbar_thumb = "#222222",
	},

	-- font = wezterm.font({
	-- 	family = "BerkeleyMono Nerd Font Mono", -- Replace with your preferred font that supports ligatures
	-- 	-- harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03" }, -- Enables various ligature features
	-- 	harfbuzz_features = { "calt", "liga", "dlig" },
	-- }),
	--

	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	enable_wayland = false,
	enable_kitty_graphics = true,

	-- font = require("wezterm").font_with_fallback({
	-- family = "BerkeleyMono Nerd Font Mono",
	-- font_rules = {
	-- {
	-- 	intensity = "Normal",
	-- 	italic = false,
	-- 	font = wezterm.font("BerkeleyMono Nerd Font Mono", { italic = false, weight = "Regular" }),
	-- },
	-- {
	-- 	intensity = "Normal",
	-- 	italic = true,
	-- 	font = wezterm.font("BerkeleyMono Nerd Font Mono Italic", { italic = true, weight = "Regular" }),
	-- },
	-- {
	-- 	intensity = "Bold",
	-- 	italic = false,
	-- 	font = wezterm.font("BerkeleyMono Nerd Font Mono Bold", { italic = false, weight = "Bold" }),
	-- },
	-- {
	-- 	intensity = "Bold",
	-- 	italic = true,
	-- 	font = wezterm.font("BerkeleyMono Nerd Font Mono Bold Italic", { italic = true, weight = "Bold" }),
	-- },
	-- },
	-- }),

	-- font_rules = {
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = false,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono", { italic = false, weight = "Regular" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono Italic", { italic = true, weight = "Regular" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono", { italic = false, weight = "Bold" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono", { italic = true, weight = "Bold" }),
	-- 	},
	-- },
	--
	-- font_rules = {
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = false,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono", { italic = false, weight = "Regular" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono Italic", { italic = true, weight = "Regular" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono Bold", { italic = false, weight = "Bold" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono Bold Italic", { italic = true, weight = "Bold" }),
	-- 	},
	-- },

	-- font_rules = {
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = false,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono"),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono Italic"),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono Bold"),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("BerkeleyMono Nerd Font Mono Bold Italic"),
	-- 	},
	-- },

	-- <-
	--
	--
	--
	-- font_shaper = "Harfbuzz",
	-- harfbuzz_features = { "calt", "liga", "dlig" },
	-- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	-- harfbuzz_features = nil,
	-- cursor_blink_ease_in = "EaseOut",
	-- cursor_blink_ease_out = "EaseOut",
	-- default_cursor_style = "BlinkingBlock",
	-- cursor_blink_rate = 650,
	-- harfbuzz_features = { "zero", "ss01", "cv05" },
	-- font = wezterm.font("GeistMono Nerd Font Mono", { weight = "Regular" }),
	-- font = wezterm.font("CommitMono Nerd Font Mono", { weight = "Regular" }),
	-- font = wezterm.font(
	-- 	"BerkeleyMono Nerd Font Mono Plus Font Awesome Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Material Design Icons Plus Weather Icons",
	-- 	{ weight = "Regular" }
	-- ),
	-- font = wezterm.font("BerkeleyMono Nerd Font Mono"),
	font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	-- font = wezterm.font("SFMono Nerd Font", { weight = "Regular" }),
	-- font = wezterm.font("CoFo Sans Mono VF", { weight = "Regular" }),
	-- font = wezterm.font("Recursive Mono Casual Static", { weight = "Regular" }),
	-- font = wezterm.font("Cascadia Code NF", { weight = "Regular" }),
	-- font = wezterm.font("BlexMono Nerd Font", { weight = "Regular" }),
	-- font = wezterm.font("OperatorMono Nerd Font", { weight = "Regular" }),
	-- font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" }),
	-- font = wezterm.font("CartographCF Nerd Font Mono", { weight = "Regular" }),
	-- font_rules = {
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = false,
	-- 		font = wezterm.font("CartographCF Nerd Font Mono", { italic = false, weight = "Regular" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font("CartographCF Nerd Font Mono", { italic = true, weight = "Regular" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("CartographCF Nerd Font Mono", { italic = false, weight = "Bold" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("CartographCF Nerd Font Mono", { italic = true, weight = "Bold" }),
	-- 	},
	-- },
	--
	--config.font = wezterm.font({ family = "VictorMono Nerd Font" })

	-- config.font_rules = {
	--     {
	--         intensity = "Bold",
	--         italic = true,
	--         font = wezterm.font({
	--             family = "VictorMono Nerd Font",
	--             weight = "Bold",
	--             style = "Italic",
	--         }),
	--     },
	--     {
	--         italic = true,
	--         intensity = "Half",
	--         font = wezterm.font({
	--             family = "VictorMono Nerd Font",
	--             weight = "DemiBold",
	--             style = "Italic",
	--         }),
	--     },
	--     {
	--         italic = true,
	--         intensity = "Normal",
	--         font = wezterm.font({
	--             family = "VictorMono Nerd Font",
	--             style = "Italic",
	--         }),
	--     },
	-- }
	--
	font_size = 20,
	-- enable_csi_u_key_encoding = true,
	-- allow_win32_input_mode = true,
	animation_fps = 240,
	max_fps = 240,
	-- front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",

	enable_kitty_keyboard = true,
	enable_tab_bar = true,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
	-- hyperlink_rules = {
	-- 	-- Matches: a URL in parens: (URL)
	-- 	{
	-- 		regex = "\\((\\w+://\\S+)\\)",
	-- 		format = "$1",
	-- 		highlight = 1,
	-- 	},
	-- 	-- Matches: a URL in brackets: [URL]
	-- 	{
	-- 		regex = "\\[(\\w+://\\S+)\\]",
	-- 		format = "$1",
	-- 		highlight = 1,
	-- 	},
	-- 	-- Matches: a URL in curly braces: {URL}
	-- 	{
	-- 		regex = "\\{(\\w+://\\S+)\\}",
	-- 		format = "$1",
	-- 		highlight = 1,
	-- 	},
	-- 	-- Matches: a URL in angle brackets: <URL>
	-- 	{
	-- 		regex = "<(\\w+://\\S+)>",
	-- 		format = "$1",
	-- 		highlight = 1,
	-- 	},
	-- 	-- Then handle URLs not wrapped in brackets
	-- 	{
	-- 		-- Before
	-- 		--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
	-- 		--format = '$0',
	-- 		-- After
	-- 		regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
	-- 		format = "$1",
	-- 		highlight = 1,
	-- 	},
	-- 	-- implicit mailto link
	-- 	{
	-- 		regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
	-- 		format = "mailto:$0",
	-- 	},
	-- },
	keys = {
		-- Turn off the default CMD-m Hide action, allowing CMD-m to be potentially recognized and handled by the tab
		{
			key = "m",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},

		-- Disable the default CMD-c copy action
		{
			key = "c",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},

		-- Redo (Cmd-Shift-Z)
		{
			key = "z",
			mods = "CMD|SHIFT",
			action = act.SendKey({
				key = "r",
				mods = "CTRL",
			}),
		},

		-- Disable CMD-Left default action
		{
			key = "LeftArrow",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},

		-- Disable CMD-Right default action
		{
			key = "RightArrow",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},

		-- Disable Delete default action
		{
			key = "Delete",
			action = act.SendKey({
				key = "Delete",
			}),
		},

		-- Disable CMD-X default action
		{
			key = "x",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},

		-- Disable CMD-1 default action
		{
			key = "1",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},

		-- Disable CMD-r default action
		{
			key = "r",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},

		-- Disable CMD-SHIFT-w default action
		{
			key = "w",
			mods = "CMD|SHIFT",
			action = act.SendKey({
				key = "w",
				mods = "CMD|SHIFT",
			}),
		},

		-- Disable CMD-2 default action
		-- {
		-- 	key = "2",
		-- 	mods = "CMD",
		-- 	action = act.DisableDefaultAssignment,
		-- },

		-- Disable CMD-V default action
		-- {
		-- 	key = "v",
		-- 	mods = "CMD",
		-- 	action = act.DisableDefaultAssignment,
		-- },
	},
	-- For example, changing the color scheme:
	-- color_scheme = "AdventureTime"
}

-- local mux = wezterm.mux
--
-- wezterm.on("gui-startup", function()
-- 	local _, _, window = mux.spawn_window({})
-- 	window:gui_window():maximize()
-- end)

return config
