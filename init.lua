require("core.options")
require("core.autocmds")
require("core.keymaps")
require("bootstrap").lazy()

vim.cmd.colorscheme("tokyodark")

local icons = require("icons")

require("lazy").setup({
  defaults = { lazy = true },
  spec = {
    { import = "plugins" },
  },
  ui = {
    icons = {
      ft = "",
      loaded = icons.check,
      not_loaded = icons.circle,
    },
  },
  install = {
    colorscheme = { "tokyodark" },
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
