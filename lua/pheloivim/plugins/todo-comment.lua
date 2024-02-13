return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  cmd = { "TodoTrouble", "TodoTelescope" },
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
  keys = {
    { "<leader>xt", "<cmd>TodoQuickFix<cr>", desc = "Todo list" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo list" },
  },
}
