return {
  "Wansmer/treesj",
  keys = {
    { "<leader>m", vim.cmd.TSJToggle, desc = "Toggle node under cursor" },
    { "<leader>s", vim.cmd.TSJSplit, desc = "Split node under cursor" },
    { "<leader>j", vim.cmd.TSJJoin, desc = "Join node under cursor" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    use_default_keymaps = false,
  },
}
