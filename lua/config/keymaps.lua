local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<F2>", ":NvimTreeToggle<cr>", opts)
keymap("", "<F3>", ":NvimTreeFocus<cr>", opts)

keymap("", "<F5>", ":ToggleTerm<cr>", opts)

keymap("", "1", ":HopWord<cr>", opts)
keymap("", "2", ":HopLine<cr>", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
