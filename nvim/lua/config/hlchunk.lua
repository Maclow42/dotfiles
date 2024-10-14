local catppuccin = require("catppuccin.palettes").get_palette()
require("hlchunk").setup({
	chunk = {
		enable = true,
		style = {
		{ fg = catppuccin.blue },
		{ fg = catppuccin.red }, 
		},
		delay = 50,
	},
	indent = {
		enable = true,
		chars = { "┆" },
	},
	line_num = {
		enable = true,
		style = catppuccin.blue,
	},
	blank = {
		enable = false,
	},
})