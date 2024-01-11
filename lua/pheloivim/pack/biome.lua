return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { { "biome", "prettier" } },
        javascriptreact = { { "biome", "prettier" } },
        typescript = { { "biome", "prettier" } },
        typescriptreact = { { "biome", "prettier" } },
        json = { { "biome", "prettier" } },
        jsonc = { { "biome", "prettier" } },
      },
    },
  },
}
