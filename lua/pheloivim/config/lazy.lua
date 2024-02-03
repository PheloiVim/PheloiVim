require("lazy").setup({
  spec = {
    { import = "pheloivim.plugins" }, -- import default plugins
    { import = "pheloivim.pack" }, -- import extra config (language, tools)
  },
  ui = {
    icons = {
      loaded = "󰗠",
      not_loaded = "",
    },
  },
  defaults = {
    lazy = true, -- lazy load all plugins
    version = false, -- always use the latest git commit
  },
  change_detection = {
    enabled = false,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
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
