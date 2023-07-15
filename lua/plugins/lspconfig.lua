return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    {
      "folke/neodev.nvim",
      opts = {
        library = {
          enabled = true,
          plugins = true,
          types = true,
        },
      },
    },
  },
  config = function()
    require "lsp"
    local signs = {
      { name = "DiagnosticSignError", text = "󰅙" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "󰌵" },
      { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text })
    end
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
    vim.diagnostic.config {
      enabled = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "",
      },
      signs = {
        active = signs,
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        source = "always",
      },
    }
  end,
}
