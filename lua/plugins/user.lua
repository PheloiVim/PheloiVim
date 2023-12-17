return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = false,
    },
  },

  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    keys = {
      { "<leader>gnt", "<cmd>Neogit<cr>", desc = "Open Neogit Tab Page" },
      { "<leader>gnc", "<cmd>Neogit commit<cr>", desc = "Open Neogit Commit Page" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      disable_hint = true,
    },
  },

  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<F5>", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
    },
    opts = {
      open_mapping = [[<F5>]],
      size = 15,
      direction = "horizontal",
    },
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
}
