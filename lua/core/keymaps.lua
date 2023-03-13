local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Change default leader key to <space>
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- NvimTree
keymap("n", "<F2>", "<cmd>NvimTreeToggle<cr>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)
keymap("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)

-- Move while insert
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Save
keymap("n", "<C-s>", "<cmd>w<cr>")

-- Quit
keymap("n", "<C-q>", "<cmd>q<cr>")

-- Comment
keymap("x", "<leader>/", '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Toggle terminal
keymap("n", "<F5>", "<cmd>ToggleTerm<cr>", opts)

--Toggle Trouble
keymap("n", "<C-n>", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>lq", "<cmd>TroubleToggle quickfix<cr>", opts)

-- Format
keymap("n", "<C-f>", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Buffer
keymap("n", "<TAB>", "<cmd>bnext<cr>", opts) -- next buffer
keymap("n", "<S-TAB>", "<cmd>bprevious<cr>", opts) -- previous buffer
keymap("n", "<leader>q", "<cmd>bdelete<cr>", opts) -- close buffer

-- No hl search
keymap("n", "<ESC>", "<cmd>nohlsearch<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Toggle relative number
keymap("n", "<leader>n", "<cmd>set rnu!<cr>", opts)

-- Toggle symbols outline
keymap("n", "<C-m>", "<cmd>SymbolsOutline<cr>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
