return {
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {
      auto_enable = true,
      magic_window = true,
      auto_resize_height = true,
      preview = {
        auto_preview = true,
        show_title = true,
        delay_syntax = 50,
        wrap = false,
      },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "johmsalas/text-case.nvim",
    keys = {
      { "ga", mode = "v", desc = "Text case" },
    },
    opts = {},
  },

  {
    "farmergreg/vim-lastplace",
    event = "BufReadPost",
  },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
}
