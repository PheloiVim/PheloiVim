return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  keys = {},
  opts = {},
}
