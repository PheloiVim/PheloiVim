return {
  "folke/trouble.nvim",
  cmd = "TroubleToggle",
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
    { "<leader>xD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
  },
}
