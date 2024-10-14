-- Set up nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

	-- Load vim-snippets
require("luasnip.loaders.from_snipmate").lazy_load()

-- Basic mapping
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Use LuaSnip to expand snippets
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
	},
	sources = {
		{ name = 'nvim_lsp' }, -- LSP source
		{ name = 'buffer' },   -- Buffer source
		{ name = 'path' },     -- Path source
		{ name = 'luasnip' },  -- Snippet source
	},

-- Here we choose how the completion window will appear
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
		-- NOTE: order matters
		vim_item.menu = ({
			nvim_lsp = "[LSP]",
			buffer = "[Buffer]",
		})[entry.source.name]
		return vim_item
		end,

	},

	window = {
		completion = cmp.config.window.bordered({
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Simulate rounded corners
		}),
		documentation = cmp.config.window.bordered({
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		}),
	},

	-- Here is the place where we can choose our sources, if the cmp is already configured, we can just add it here.
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = true,
	},
})