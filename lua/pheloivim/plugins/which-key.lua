return {
  "folke/which-key.nvim",
  keys = { "<leader>", "z", "d", "c", "v", "g", "]", "[", "y", "\\" },
  opts = {
    window = {
      border = "rounded",
    },
    show_help = false,
    show_keys = false,
    icons = { group = "" },
    defaults = {
      b = { name = "󰓩 Buffer" },
      c = { name = " Code", R = "Refactor" },
      f = { name = "󰈔 Find/File" },
      s = { name = " Search", n = "Noice" },
      u = { name = "󰓩 UI" },
      w = { name = " Windows" },
      x = { name = "  Diagnostics/Quickfix" },
      d = { name = " Debug" },
      t = { name = "󰙨 Test" },
      g = { name = "󰊢 Git", h = "Hunks", n = "Neogit", d = "Diff" },
      p = { name = " Packages" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults, { prefix = "<leader>", mode = { "n", "v" } })
  end,
}
