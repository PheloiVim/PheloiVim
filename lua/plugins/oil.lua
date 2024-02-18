return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = false,
    keys = {
      { "<leader>o", function() require("oil").open() end, desc = "Open folder in Oil" },
    },
  },
}
