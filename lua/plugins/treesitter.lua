return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"lua",
				"markdown",
				"markdown_inline",
				"bash",
				"html",
				"css",
				"javascript",
				"java",
				"rust",
				"cpp",
				"c",
			},
			highlight = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
