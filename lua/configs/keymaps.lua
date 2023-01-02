local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- NvimTree
keymap("n", "<F2>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<F3>", ":NvimTreeFocus<cr>", opts)

-- Hop
keymap("n", "1", ":HopWord<cr>", opts)
keymap("n", "2", ":HopLine<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Ctrl - s : save
keymap("n", "<C-s>", ":w<cr>", opts)

keymap("", "<C-f>", ":lua vim.lsp.buf.format()<cr>", opts)
