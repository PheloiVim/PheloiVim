return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<F5>", "<cmd>ToggleTerm<cr>" },
		{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>" },
	},
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 30,
			open_mapping = [[<F5>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "single",
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end
	end,
}
