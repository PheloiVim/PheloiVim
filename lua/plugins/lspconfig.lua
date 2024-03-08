return {
	"neovim/nvim-lspconfig",
	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "<c-k>", mode = "i", false }
	end,
}
