vim.opt.numberwidth = 1
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.shell = "fish"

-- disable some default providers
for _, provider in ipairs({ "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
