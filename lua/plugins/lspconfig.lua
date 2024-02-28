return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0

      vim.b.lsp_zero_enable_autoformat = 0
      vim.g.lsp_zero_ui_float_border = 0
    end,
  },
}
