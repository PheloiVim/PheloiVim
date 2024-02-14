return {
  "folke/which-key.nvim",
  keys = { "<leader>", "z", "d", "c", "v", "g", "]", "[", "y", "\\" },
  init = function()
    vim.opt.timeoutlen = 200
    vim.opt.ttimeoutlen = 10
  end,
  opts = {
    window = {
      border = "rounded",
    },
    show_help = false,
    show_keys = false,
    icons = { group = "" },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({
      b = { name = "󰓩 Buffer" },
      c = { name = " Code", R = "Refactor" },
      f = { name = "󰈔 Find/File" },
      s = { name = " Search", n = "Noice" },
      u = { name = "󰓩 UI" },
      w = { name = " Windows" },
      x = { name = "  Diagnostics/Quickfix" },
      d = { name = " Debug" },
      t = { name = "󰙨 Test" },
      g = { name = "󰊢 Git", h = "Hunks" },
      p = { name = " Packages" },
    }, { prefix = "<leader>", mode = { "n", "v" } })
  end,
}
