return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = false,
      spelling = true,
      registers = false,
    },
    window = {
      border = "rounded",
      position = "bottom",
      winblend = 0,
    },
    show_help = false,
    show_keys = false,
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
