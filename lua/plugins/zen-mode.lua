return {
  "folke/zen-mode.nvim",
  opts = {},
  dependencies = "folke/twilight.nvim",
  keys = {
    { "<leader>uz", function() vim.cmd("ZenMode") end, desc = "Toggle ZenMode" },
  },
}
