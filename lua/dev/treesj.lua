return {
  "Wansmer/treesj",
  keys = {
    { "<leader>m", function() vim.cmd("TSJToggle") end, desc = "Toggle node under cursor" },
    { "<leader>s", function() vim.cmd("TSJSplit") end, desc = "Split node under cursor" },
    { "<leader>j", function() vim.cmd("TSJJoin") end, desc = "Join node under cursor" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    use_default_keymaps = false,
  },
}
