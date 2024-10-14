
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"catppuccin/nvim",

	"Yggdroot/indentline",

    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

	{
		"hrsh7th/nvim-cmp", 
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",        -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer",          -- Buffer completions
			"hrsh7th/cmp-path",            -- Path completions
			"hrsh7th/cmp-cmdline",         -- Cmdline completions
			"hrsh7th/cmp-nvim-lsp-signature-help", -- Signature help
			"hrsh7th/cmp-nvim-lsp-document-symbol", -- Document symbol
			"hrsh7th/cmp-calc",            -- Calculator completion
			"saadparwaiz1/cmp_luasnip",    -- Snippet source for nvim-cmp
			"L3MON4D3/LuaSnip",            -- Snippet engine
			"honza/vim-snippets",          -- Snippet collection
	
		}
	},

	"rhysd/vim-clang-format",
	"folke/which-key.nvim",

	"jiangmiao/auto-pairs",

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons",
		  "MunifTanjim/nui.nvim",
		}
	},

	"shellRaining/hlchunk.nvim",

	"declancm/cinnamon.nvim",
	
	{
		"RRethy/vim-illuminate",
		config = function()
		  require('illuminate').configure({
			providers = {
			  'lsp',
			  'treesitter',
			  'regex',
			},
			delay = 100,  -- Delay in milliseconds
			filetypes_denylist = {
			  'dir',
			  'fugitive',
			  'gitcommit',
			},
		  })
	
			end,
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'kdheepak/tabline.nvim',
		},
	},
	
	{
	  'onsails/lspkind-nvim',
	  config = function()
		require('lspkind').init({
		  mode = 'symbol_text',  -- Shows both symbols and text in suggestions
		  preset = 'default',
		})
	  end
	},

	{
		'anuvyklack/windows.nvim',
		dependencies = {
			'anuvyklack/middleclass',   -- Required dependency
			'anuvyklack/animation.nvim' -- Optional: for animations
		},
		config = function()
			-- Basic settings for window management
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false

			-- Plugin setup with optional animation configuration
			require('windows').setup({
			animation = {
				enable = true,  -- Enable smooth animations
				duration = 100, -- Duration of the animation in milliseconds
			}
			})
		end
		},
})

