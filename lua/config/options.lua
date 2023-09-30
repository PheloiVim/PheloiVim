vim.opt.numberwidth = 2
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.virtualedit = "block"
vim.opt.shell = "fish"

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
