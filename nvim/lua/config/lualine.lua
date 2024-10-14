local colors = {
	red = '#cdd6f4',
	grey = '#181825',
	black = '#1e1e2e',
	white = '#313244',
	light_green = '#6c7086',
	orange = '#fab387',
	green = '#a6e3a1',
	blue = '#80A7EA',
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = 'NONE' },
		b = { fg = colors.blue, bg = 'NONE' },
		c = { fg = colors.white, bg = 'NONE' },
		z = { fg = colors.white, bg = 'NONE' },
	},
	insert = { a = { fg = colors.black, bg = colors.orange } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}

-- Custom display
local function getCustomLspName()
	return "@mclow" -- Custom text to display
end

	local function getLspName()
	local msg = 'NO LSP'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return " " .. client.name
		end
	end
	return " " .. msg
end

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.orange, fg = "#1e1e2e" },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = "#313244", fg = "#80A7EA" },
}

local space = {
	function()
		return " "
	end,
	color = { bg = "NONE", fg = "#80A7EA" },
}

local filename = {
	'filename',
	color = { bg = "#80A7EA", fg = "#242735" },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#313244" },
	separator = { left = "", right = "" },
}

local fileformat = {
	'fileformat',
	color = { bg = "#b4befe", fg = "#313244" },
	separator = { left = "", right = "" },
}

local path = {
	'filename',
	path = 1,  -- This option sets the path to be displayed
	color = { fg = colors.white, bg = colors.blue },  -- Customize colors
	separator = { left = "", right = "" },
}

local file_size = {
	function()
		local size = vim.fn.getfsize(vim.fn.expand('%:p'))
		return size > 0 and (size .. ' bytes') or 'NO FILE'
	end,
	color = { bg = "#313244", fg = colors.blue },
	separator = { left = '', right = '' },
}

local encoding = {
	'encoding',
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local branch = {
	'branch',
	color = { bg = "#a6e3a1", fg = "#313244" },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = "#313244", fg = "#313244" },
	separator = { left = "", right = "" },
}

local function custom_location()
	return string.format("L: %d - C: %d", vim.fn.line('.'), vim.fn.col('.'))
end

local location = {
	custom_location,
	color = { bg = "#313244", fg = colors.blue },
	separator = { left = "", right = "" },
}
local modes = {
	'mode', 
	color = function()
		local mode = vim.fn.mode()
		if mode == 'n' then
			return { bg = colors.blue, fg = colors.black } -- Normal mode background in blue
		elseif mode == 'i' then
			return { bg = colors.orange, fg = colors.black } -- Insert mode background in orange
		elseif mode == 'v' then
			return { bg = colors.green, fg = colors.black } -- Visual mode background in green
		else
			return { bg = colors.green, fg = colors.black } -- Replace mode background in green
		end
	end,

	separator = { left = "", right = "" },
}

	local dia = {
	'diagnostics',
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { modes, vim_icons },
		lualine_b = { space },
		lualine_c = { filename, filetype, space, branch, diff },
		lualine_x = { location, space },
		lualine_y = { encoding, fileformat },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = { path, file_size },
		lualine_b = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { dia, lsp, 
			--{ getCustomLspName, separator = { left = "", right = "" }, color = { bg = colors.blue, fg = colors.black } },
		},  
	},
	winbar = {
},
inactive_winbar = {
},
}