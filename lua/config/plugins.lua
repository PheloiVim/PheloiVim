-- Pop up packer window
require('packer').init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Auto reload plugins when save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
vim.cmd [[packadd packer.nvim]]

-- Install plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'gelguy/wilder.nvim'
	use 'folke/tokyonight.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-tree/nvim-tree.lua'
	use 'RRethy/vim-illuminate'
	use 'windwp/nvim-autopairs'
	use 'nvim-treesitter/nvim-treesitter'
	use 'akinsho/toggleterm.nvim'
	use 'goolord/alpha-nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'lewis6991/impatient.nvim'
	use 'akinsho/bufferline.nvim'
	use 'lewis6991/gitsigns.nvim'
	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'nvim-lua/plenary.nvim'
	-- CMP
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lua'
	-- Snippets
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	-- Auto set up configuration
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
