local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

keymap("", "<F2>", ":NvimTreeToggle<cr>", opts)
keymap("", "<F3>", ":NvimTreeFocus<cr>", opts)

keymap("", "<F5>", ":ToggleTerm<cr>", opts)
