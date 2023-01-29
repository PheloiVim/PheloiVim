local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	print("Installing packer close and reopen Neovim...")
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

-- Packer init
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		working_sym = "⟳",
		error_sym = "✗ ",
		done_sym = " ",
		removed_sym = " ",
		moved_sym = "",
		open_fn = function()
			return require("packer.util").float({ border = "solid" })
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
	use("folke/tokyonight.nvim")
	use("nvim-tree/nvim-web-devicons")
	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
    use("folke/trouble.nvim")
	-- Formatters, Linters
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-lua/plenary.nvim")
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
	-- Statusline
	use("nvim-lualine/lualine.nvim")
	-- Better highlight
	use("nvim-treesitter/nvim-treesitter")
	-- Finder
	use("nvim-telescope/telescope.nvim")
	-- Improve startup time
	use("lewis6991/impatient.nvim")
	-- Bufferline
	use("akinsho/bufferline.nvim")
	-- Explorer
	use("nvim-tree/nvim-tree.lua")
	-- Comment
	use("numToStr/Comment.nvim")
	-- Terminal
	use("akinsho/toggleterm.nvim")
	-- Move faster
	use("phaazon/hop.nvim")
	-- Git
	use("lewis6991/gitsigns.nvim")
	-- Identline
	use("lukas-reineke/indent-blankline.nvim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
