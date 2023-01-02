local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		working_sym = "ﲊ",
		error_sym = "✗ ",
		done_sym = " ",
		removed_sym = " ",
		moved_sym = "",
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
	auto_clean = true,
	compile_on_sync = true,
})

-- Install plugins
return packer.startup(function(use)
	-- Have packer manage it self
	use("wbthomason/packer.nvim")
	-- Theme
	use("EdenEast/nightfox.nvim")
	-- Statusline
	use("nvim-lualine/lualine.nvim")
	-- Git
	use("lewis6991/gitsigns.nvim")
	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- Formatters, Linters
	use("jose-elias-alvarez/null-ls.nvim")
	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- Completion engine
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("windwp/nvim-autopairs")
	use("nvim-tree/nvim-web-devicons")
	-- Better highlight
	use("nvim-treesitter/nvim-treesitter")
	-- Explorer
	use("nvim-tree/nvim-tree.lua")
	-- Greeter
	use("goolord/alpha-nvim")
	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/plenary.nvim")
	-- Improve startup time
	use("lewis6991/impatient.nvim")
	-- Bufferline
	use("akinsho/bufferline.nvim")
	-- Move faster
	use("phaazon/hop.nvim")
	-- Identline
	use("lukas-reineke/indent-blankline.nvim")
	-- Comment
	use("numToStr/Comment.nvim")
	-- Illuminate
	use("RRethy/vim-illuminate")
	-- Terminal
	use("akinsho/toggleterm.nvim")
end)
