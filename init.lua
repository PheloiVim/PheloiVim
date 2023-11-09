local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  require("bootstrap").lazy(lazypath) -- Install lazy.nvim and plugins
end
vim.opt.rtp:prepend(lazypath)

local modules = {
  "config.keymaps",
  "config.options",
  "config.autocmds",
  "config.lazy",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then error(("Error loading %s...\n\n%s"):format(module, err)) end
end
