local map = vim.keymap.set

-- Configure leader key
vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = "\\" -- Set local leader key to backslash

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

-- Search within visual selection
map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

-- Clear search highlight
map("n", "<esc>", vim.cmd.nohlsearch, { desc = "Clear hlsearch" })

-- Navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Resize window with arrow keys
map("n", "<C-Up>", function()
  vim.cmd("resize +2")
end, { desc = "Increase window height" })
map("n", "<C-Down>", function()
  vim.cmd("resize -2")
end, { desc = "Decrease window height" })
map("n", "<C-Left>", function()
  vim.cmd("vertical resize -2")
end, { desc = "Decrease window width" })
map("n", "<C-Right>", function()
  vim.cmd("vertical resize +2")
end, { desc = "Increase window width" })
