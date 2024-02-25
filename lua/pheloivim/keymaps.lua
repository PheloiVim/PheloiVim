local map = vim.keymap.set
vim.g.mapleader = " "

-- Lazy
map("n", "<leader>pl", function() require("lazy").home() end, { desc = "Lazy" })
map("n", "<leader>ps", function() require("lazy").sync() end, { desc = "Lazy sync" })
map("n", "<leader>pu", function() require("lazy").update() end, { desc = "Lazy update" })
map("n", "<leader>pc", function() require("lazy").check() end, { desc = "Lazy check for update" })

-- Clear search with <ESC>
map("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Windows
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })

-- Quick fix
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location list" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix list" })
map("n", "<leader>xc", ":cexpr []<cr>", { desc = "Clear list" })
