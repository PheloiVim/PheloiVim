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
    icons = { group = "" },
    defaults = {
      b = { name = "󰓩 buffer" },
      c = { name = " code" },
      f = { name = "󰈔 file/find" },
      s = { name = " search", n = "noice" },
      u = { name = "󰓩 ui" },
      w = { name = " windows" },
      x = { name = "  diagnostics/quickfix" },
      d = { name = " debug" },
      t = { name = "󰙨 test" },
      g = { name = "󰊢 git", h = "hunks", n = "neogit", d = "diff" },
      p = { name = " packages" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults, { prefix = "<leader>" })
  end,
}
