local opt = vim.opt
local g = vim.g

opt.laststatus = 0
opt.hlsearch = true
opt.backup = false
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.smartindent = true
opt.cursorline = true
opt.termguicolors = true
opt.expandtab = true
opt.wildmenu = false
opt.completeopt = { "menuone", "noselect" }
opt.shiftwidth = 4
opt.tabstop = 4
opt.wrap = true
opt.softtabstop = 2
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.shortmess:append "sI"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 250
opt.swapfile = false
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
