return {
	"nvimtools/none-ls.nvim",
	opts = function(_, opts)
		local nls = require("null-ls")
		vim.list_extend(opts.sources, {
			nls.builtins.code_actions.statix,
			nls.builtins.formatting.alejandra,
			nls.builtins.diagnostics.deadnix,
		})
	end,
}
