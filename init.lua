local modules = {
  "pheloivim.options",
  "pheloivim.keymaps",
  "pheloivim.autocmds",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then error(("Error loading %s...\n\n%s"):format(module, err)) end
end

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" }, -- import plugins
    { import = "dev" }, -- LSP, nvim-dap, ...
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
