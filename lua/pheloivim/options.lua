vim.opt.autowrite = true
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = true
vim.opt.swapfile = false
vim.opt.conceallevel = 0
vim.opt.updatetime = 100
vim.opt.title = true
vim.opt.tabstop = 2
vim.opt.splitkeep = "screen"
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.list = false
vim.opt.scrolloff = 4
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.relativenumber = true
vim.opt.inccommand = "nosplit"
vim.opt.preserveindent = true
vim.opt.laststatus = 3
vim.opt.hidden = true
vim.opt.copyindent = true
vim.opt.numberwidth = 2
vim.opt.shortmess:append({ s = true, I = true })

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
