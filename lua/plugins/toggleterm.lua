return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<F5>", "<cmd>ToggleTerm<cr>" },
  },
  config = function()
    require("toggleterm").setup {
      size = 15,
      open_mapping = [[<F5>]],
      shell = "fish",
      direction = "horizontal",
    }
  end,
}
