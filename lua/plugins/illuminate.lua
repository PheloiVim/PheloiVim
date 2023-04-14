return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 200,
    filetypes_denylist = {
      "lazy",
      "help",
      "lspinfo",
      "NvimTree",
      "TelescopePrompt",
      "Trouble",
      "toggleterm",
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
