local map = vim.keymap.set

-- Save file with Ctrl+s
map("n", "<C-s>", vim.cmd.w, { desc = "Save file" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Condition on `v:count == 0` to allow easier use of relative line numbers
map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Search inside visually highlighted text. Use `silent = false` for it to take effect immediately.
map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

-- Clear search with <ESC>
map("n", "<esc>", vim.cmd.nohlsearch, { desc = "Clear hlsearch" })

-- Navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Resize with arrows
map("n", "<C-Up>", function() vim.cmd("resize +2") end, { desc = "Increase window height" })
map("n", "<C-Down>", function() vim.cmd("resize -2") end, { desc = "Decrease window height" })
map("n", "<C-Left>", function() vim.cmd("vertical resize -2") end, { desc = "Decrease window width" })
map("n", "<C-Right>", function() vim.cmd("vertical resize +2") end, { desc = "Increase window width" })
