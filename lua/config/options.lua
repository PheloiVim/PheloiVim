vim.opt.shell = "fish"
vim.opt.breakindent = true
vim.opt.redrawtime = 1500
vim.opt.timeoutlen = 200
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 100
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.list = true
vim.opt.listchars = {
  tab = "❘-",
  trail = "·",
  lead = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×",
}

vim.g.autoformat = false

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
