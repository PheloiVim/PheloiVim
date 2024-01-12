return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {},
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts) opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "prettier" }) end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { { "biome", "prettier" } },
        jsonc = { { "biome", "prettier" } },
        javascript = { { "biome", "prettier" } },
        javascriptreact = { { "biome", "prettier" } },
        typescript = { { "biome", "prettier" } },
        typescriptreact = { { "biome", "prettier" } },
        markdown = { "prettier" },
        yaml = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        graphql = { "prettier" },
      },
    },
  },
}
