return {
  "folke/which-key.nvim",
  keys = { "<leader>", '"', "'", "`", "c", "v", "d" },
  opts = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
    motions = {
      count = true,
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    window = {
      border = "solid",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    key_labels = {
      ["<space>"] = "SPC",
    },
    ignore_missing = true,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
    show_help = false,
    triggers = "auto",
  },
  config = function()
    local mappings = {
      l = {
        name = "  LSP",
      },
      f = {
        name = "  Telescope",
      },
      t = {
        name = "  ToggleTerm",
      },
    }
    require("which-key").register(mappings, {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = true,
    })
  end,
}
