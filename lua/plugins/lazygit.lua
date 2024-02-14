return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit",
  keys = {
    { "<leader>gl", function() vim.cmd("LazyGit") end, desc = "LazyGit" },
  },
}
