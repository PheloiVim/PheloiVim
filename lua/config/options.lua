vim.opt.whichwrap:append "<>[]hl"
vim.opt.relativenumber = false
vim.opt.numberwidth = 2
vim.b.autoformat = false

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
