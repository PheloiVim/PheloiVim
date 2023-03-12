return {
	"akinsho/toggleterm.nvim",
	cmd = "ToggleTerm",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 10,
			hide_numbers = true,
			start_in_insert = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			insert_mappings = true,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
