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
			require("symbols-outline").setup()
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
		dependencies = {
			{
				"folke/trouble.nvim",
				name = "trouble",
			},
			{
				"williamboman/mason.nvim",
				name = "mason",
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
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		lazy = true,
		cmd = { "Telescope find_files" },
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
		event = "VeryLazy",
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
		event = "VeryLazy",
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
		event = "VeryLazy",
		config = function()
			require("plugins.hop")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		name = "indentline",
		lazy = true,
		event = "VeryLazy",
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
		event = "VeryLazy",
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
})
