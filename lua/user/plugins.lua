-- Pop up packer window
require('packer').init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Auto reload plugins 
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
vim.cmd [[packadd packer.nvim]]

-- Install plugins here
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'windwp/nvim-autopairs'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'akinsho/bufferline.nvim'
	use 'catppuccin/nvim'
	use 'goolord/alpha-nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'akinsho/toggleterm.nvim'
	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	use 'jose-elias-alvarez/null-ls.nvim'
end)
