return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    keys = {
      { "<leader>gnt", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
      { "<leader>gnc", "<cmd>Neogit commit<CR>", desc = "Open Neogit Commit Page" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      disable_hint = true,
    },
  },
}
