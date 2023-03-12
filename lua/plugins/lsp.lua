return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local status_ok, _ = pcall(require, "lspconfig")
		if not status_ok then
			return
		end

		require("lsp.servers")
		require("lsp.handlers").setup()
	end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({
					ui = {
						border = "solid",
						icons = {
							package_installed = " ",
							package_pending = " ",
							package_uninstalled = " ",
						},
					},
				})
			end,
		},
		{ "folke/trouble.nvim", config = true },
		{ "RRethy/vim-illuminate" },
		{
			"ray-x/lsp_signature.nvim",
			config = function()
				require("lsp_signature").setup()
			end,
		},
		{
			"SmiteshP/nvim-navic",
			config = function()
				local navic = require("nvim-navic")
				navic.setup({
					separator = " > ",
					highlight = true,
					depth_limit = 5,
					depth_limit_indicator = "..",
					safe_output = true,
					icons = {
						File = " ",
						Module = " ",
						Namespace = " ",
						Package = " ",
						Class = " ",
						Method = " ",
						Property = " ",
						Field = " ",
						Constructor = " ",
						Enum = "練",
						Interface = "練",
						Function = " ",
						Variable = " ",
						Constant = " ",
						String = " ",
						Number = " ",
						Boolean = "◩ ",
						Array = " ",
						Object = " ",
						Key = " ",
						Null = "ﳠ ",
						EnumMember = " ",
						Struct = " ",
						Event = " ",
						Operator = " ",
						TypeParameter = " ",
					},
				})
			end,
		},
		{
			"j-hui/fidget.nvim",
			config = function()
				local fidget = require("fidget")
				fidget.setup({
					text = {
						spinner = "pipe",
					},
					timer = {
						spinner_rate = 100,
					},
				})
			end,
		},
	},
}
