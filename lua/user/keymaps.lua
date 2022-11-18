-- Shorter function
local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

keymap("", "<F2>", ":NvimTreeToggle<cr>", opts)			-- Open nvim_tree
keymap("", "<F3>", ":NvimTreeFocus<cr>", opts)			-- Focus nvim_tree

keymap("", "<F5>", ":ToggleTerm<cr>", opts)

keymap("", "<F4>", ":Telescope find_files<cr>", opts)
