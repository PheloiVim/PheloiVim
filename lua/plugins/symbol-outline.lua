return {
	"simrat39/symbols-outline.nvim",
	keys = require("core.keymaps").SymbolsOutline,
	config = function()
		require("symbols-outline").setup({
			auto_close = true,
		})
	end,
}
