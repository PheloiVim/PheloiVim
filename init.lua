local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  require("bootstrap").lazy(lazypath) -- Install lazy.nvim and plugins
end
vim.opt.rtp:prepend(lazypath)

require("config.keymaps")
require("config.options")
require("config.autocmds")
require("config.lazy")
