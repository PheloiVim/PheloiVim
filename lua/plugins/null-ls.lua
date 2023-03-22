return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			debug = false,
			sources = {
				formatting.prettier,
				formatting.stylua,
				formatting.clang_format,
				formatting.rustfmt,
				formatting.ptop,
			},
		})
	end,
}
