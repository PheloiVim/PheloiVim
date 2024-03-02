return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
  keys = {
    { "<leader>xt", vim.cmd.TodoQuickFix, desc = "Todo list" },
    { "<leader>st", vim.cmd.TodoTelescope, desc = "Todo list (Telescope)" },
  },
}
