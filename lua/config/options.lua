local o = vim.o
local opt = vim.opt
local g = vim.g

o.showmode = false
o.wildmenu = false
o.hlsearch = true
o.cursorline = true
o.backup = false
o.number = true
o.numberwidth = 2
o.tabstop = 4
o.signcolumn = "yes"
o.wrap = false
o.linebreak = true
o.scrolloff = 8
o.sidescrolloff = 8
o.termguicolors = true
o.shiftwidth = 4
o.swapfile = false
o.colorcolumn = 80
o.smartcase = true
o.filetype = true
o.smartindent = true
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noselect" }
opt.updatetime = 300
opt.laststatus = 2
opt.title = true
opt.expandtab = true
opt.shell = 'fish'

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
