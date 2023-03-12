return {
	"simrat39/symbols-outline.nvim",
	cmd = "SymbolsOutline",
	config = function()
		require("symbols-outline").setup({
			auto_close = true,
		})
	end,
}
