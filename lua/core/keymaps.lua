local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- better up/down
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move text up and down
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
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

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize -2<CR>", opts)

-- Buffer
keymap("n", "<TAB>", "<cmd>BufferLineCycleNext<cr>", opts) -- next buffer
keymap("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>", opts) -- previous buffer
keymap("n", "<leader>q", "<cmd>bdelete<cr>", opts) -- close buffer

-- No hl search
keymap("n", "<ESC>", "<cmd>nohlsearch<cr>", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Toggle relative number
keymap("n", "<leader>n", "<cmd>set rnu!<cr>", opts)

-- Format
keymap("n", "<C-f>", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
