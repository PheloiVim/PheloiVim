return {
  "folke/zen-mode.nvim",
  opts = {},
  keys = {
    { "<leader>uz", function() vim.cmd("ZenMode") end, desc = "Toggle ZenMode" },
  },
}
