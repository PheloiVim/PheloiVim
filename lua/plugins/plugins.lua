local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	-- Theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	"nvim-tree/nvim-web-devicons",
	-- LSP
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason.nvim",
		lazy = true,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
	},
	-- Formatters, Linters
	{ "jose-elias-alvarez/null-ls.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	-- Completion engine
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"windwp/nvim-autopairs",
	-- Status line
	"nvim-lualine/lualine.nvim",
	-- Better highlight
	"nvim-treesitter/nvim-treesitter",
	-- Finder
	{ "nvim-telescope/telescope.nvim", lazy = true },
	-- Improve startup time
	{ "lewis6991/impatient.nvim", lazy = true },
	-- Bufferline
	"akinsho/bufferline.nvim",
	-- Explorer
	{ "nvim-tree/nvim-tree.lua", lazy = true },
	-- Comment
	{ "numToStr/Comment.nvim", lazy = true },
	-- Terminal
	{ "akinsho/toggleterm.nvim", lazy = true },
	-- Move faster
	{ "phaazon/hop.nvim", lazy = true },
	-- Git
	{ "lewis6991/gitsigns.nvim", lazy = true },
	-- Debug
	{ "mfussenegger/nvim-dap", lazy = true },
	{ "rcarriga/nvim-dap-ui", lazy = true },
	-- Identline
	{ "lukas-reineke/indent-blankline.nvim", lazy = false },
})
