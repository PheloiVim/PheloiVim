local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Installing lazy.nvim")
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
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		name = "symbol outline",
		lazy = true,
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup({
				highlight_hovered_item = true,
				show_guides = true,
				auto_preview = false,
				position = "right",
				relative_width = true,
				width = 25,
				auto_close = false,
				show_numbers = false,
				show_relative_numbers = false,
				show_symbol_details = true,
				preview_bg_highlight = "Pmenu",
				autofold_depth = nil,
				auto_unfold_hover = true,
				fold_markers = { "", "" },
				wrap = false,
				keymaps = { -- These keymaps can be a string or a table for multiple keys
					close = { "<Esc>", "q" },
					goto_location = "<Cr>",
					focus_location = "o",
					hover_symbol = "<C-space>",
					toggle_preview = "K",
					rename_symbol = "r",
					code_actions = "a",
					fold = "h",
					unfold = "l",
					fold_all = "W",
					unfold_all = "E",
					fold_reset = "R",
				},
				lsp_blacklist = {},
				symbol_blacklist = {},
				symbols = {
					File = { icon = "", hl = "@text.uri" },
					Module = { icon = "", hl = "@namespace" },
					Namespace = { icon = "", hl = "@namespace" },
					Package = { icon = "", hl = "@namespace" },
					Class = { icon = "𝓒", hl = "@type" },
					Method = { icon = "ƒ", hl = "@method" },
					Property = { icon = "", hl = "@method" },
					Field = { icon = "", hl = "@field" },
					Constructor = { icon = "", hl = "@constructor" },
					Enum = { icon = "ℰ", hl = "@type" },
					Interface = { icon = "ﰮ", hl = "@type" },
					Function = { icon = "", hl = "@function" },
					Variable = { icon = "", hl = "@constant" },
					Constant = { icon = "", hl = "@constant" },
					String = { icon = "𝓐", hl = "@string" },
					Number = { icon = "#", hl = "@number" },
					Boolean = { icon = "⊨", hl = "@boolean" },
					Array = { icon = "", hl = "@constant" },
					Object = { icon = "⦿", hl = "@type" },
					Key = { icon = "🔐", hl = "@type" },
					Null = { icon = "NULL", hl = "@type" },
					EnumMember = { icon = "", hl = "@field" },
					Struct = { icon = "𝓢", hl = "@type" },
					Event = { icon = "🗲", hl = "@type" },
					Operator = { icon = "+", hl = "@operator" },
					TypeParameter = { icon = "𝙏", hl = "@parameter" },
					Component = { icon = "", hl = "@function" },
					Fragment = { icon = "", hl = "@constant" },
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		name = "nvim tree",
		lazy = true,
		cmd = "NvimTreeToggle",
		config = function()
			require("plugins.nvim-tree")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		name = "nvim lsp",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason.nvim",
				name = "mason",
			},
			{
				"folke/trouble.nvim",
				name = "trouble",
			},
			{
				"jose-elias-alvarez/null-ls.nvim",
				name = "null ls",
			},
		},
		config = function()
			require("lsp")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		name = "lualine",
		event = "VeryLazy",
		config = function()
			require("plugins.lualine")
		end,
	},

	{
		"nvim-lua/plenary.nvim",
		lazy = true,
		event = "VeryLazy",
	},

	{
		"j-hui/fidget.nvim",
		name = "fidget",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("fidget").setup()
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		lazy = true,
		cmd = "Telescope",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			require("plugins.telescope")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		name = "nvim cmp",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-calc",
		},
		config = function()
			require("plugins.cmp")
		end,
	},

	{
		"windwp/nvim-autopairs",
		name = "autopairs",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("plugins.autopairs")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		name = "gitsigns",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.gitsigns")
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"numToStr/Comment.nvim",
		name = "Comment",
		lazy = true,
		config = function()
			require("plugins.comment")
		end,
	},

	{
		"phaazon/hop.nvim",
		lazy = true,
		keys = {
			{ "1", "<cmd>HopWord<cr>" },
			{ "2", "<cmd>HopLine<cr>" },
		},
		config = function()
			require("plugins.hop")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		name = "indentline",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugins.indentline")
		end,
	},

	{
		"lewis6991/impatient.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("plugins.impatient")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		name = "bufferline",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("plugins.bufferline")
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		name = "toggleterm",
		lazy = true,
		cmd = "ToggleTerm",
		config = function()
			require("plugins.toggleterm")
		end,
	},

	{
		"echasnovski/mini.indentscope",
		name = "indentscope",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				draw = {
					delay = 50,
				},
			})
		end,
	},

	{
		"RRethy/vim-illuminate",
		name = "Illuminate",
		lazy = true,
		event = "VeryLazy",
	},

	{
		"SmiteshP/nvim-navic",
		name = "navic",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("plugins.navic")
		end,
	},
})
