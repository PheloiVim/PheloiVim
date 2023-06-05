-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.api.nvim_echo({ { "  Installing lazy.nvim & plugins ...", "Bold" } }, true, {})
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.autocmds")
require("core.keymaps")
require("plugins")
