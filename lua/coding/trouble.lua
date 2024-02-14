return {
  "folke/trouble.nvim",
  cmd = "TroubleToggle",
  opts = { use_diagnostic_signs = true },
  keys = {
    {
      "<leader>xd",
      function() vim.cmd("TroubleToggle document_diagnostics") end,
      desc = "Document Diagnostics",
    },
    {
      "<leader>xD",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Workspace Diagnostics",
    },
  },
}
