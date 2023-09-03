vim.opt.relativenumber = false
vim.opt.numberwidth = 2
-- vim.opt.guicursor = "i:block"
vim.opt.breakindent = true
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.virtualedit = "block"

-- vim.cmd [[
--   filetype plugin indent off
-- ]]

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
