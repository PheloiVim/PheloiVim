return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
