return {
  "folke/zen-mode.nvim",
  dependencies = {
    {
      "folke/twilight.nvim",
      opts = {
        treesitter = true,
        exclude = {
          "NvimTree",
        },
      },
    },
  },
  opts = {},
}
