return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  keys = {
    { "<leader>gnt", "<cmd>Neogit<cr>", desc = "Open Neogit Tab Page" },
    { "<leader>gnc", "<cmd>Neogit commit<cr>", desc = "Open Neogit Commit Page" },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    disable_hint = true,
  },
}
