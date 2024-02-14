return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {
    prompt_func_return_type = { go = true },
    prompt_func_param_type = { go = true },
    show_success_message = false,
  },
  keys = {
    { "<leader>cRi", mode = { "x", "n" }, function() vim.cmd("Refactor inline_var") end, desc = "Inline variable" },
    { "<leader>cRf", mode = { "x", "n" }, function() vim.cmd("Refactor extract") end, desc = "Extract function" },
    {
      "<leader>cRF",
      mode = { "x", "n" },
      function() vim.cmd("Refactor extract_to_file") end,
      desc = "Extract function to file",
    },
    { "<leader>cRv", mode = { "x", "n" }, function() vim.cmd("Refactor extract_var") end, desc = "Extract variable" },
    { "<leader>cRI", mode = { "x", "n" }, function() vim.cmd("Refactor inline_func") end, desc = "Inline function" },
    { "<leader>cRb", function() vim.cmd("Refactor extract_block") end, desc = "Extract block" },
    { "<leader>cRB", function() vim.cmd("Refactor extract_block_to_file") end, desc = "Extract block to file" },
  },
  cmd = "Refactor",
}
