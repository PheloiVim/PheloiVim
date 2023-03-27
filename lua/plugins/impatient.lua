return {
  "lewis6991/impatient.nvim",
  event = "VeryLazy",
  config = function()
    require("impatient").enable_profile()
  end,
}
