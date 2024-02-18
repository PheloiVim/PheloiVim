return {
  "folke/twilight.nvim",
  keys = {
    { "<leader>ut", function() vim.cmd("Twilight") end, desc = "Toggle Twilight" },
  },
  cmd = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
  },
}
