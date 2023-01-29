local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- NvimTree
keymap("n", "<F2>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<F3>", ":NvimTreeFocus<cr>", opts)

-- Hop
keymap("n", "1", ":HopWord<cr>", opts)
keymap("n", "2", ":HopLine<cr>", opts)
-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Move while insert
keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-j>", "<Down>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-l>", "<Right>")

-- Save
keymap("n", "<C-s>", ":w<cr>")

-- Comment
keymap("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC>:lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)

-- Toggle terminal
keymap("", "<F5>", ":ToggleTerm<cr>", opts)
