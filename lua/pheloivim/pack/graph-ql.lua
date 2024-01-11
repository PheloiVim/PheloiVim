return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "graphql" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("prettier")
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        graphql = { "prettier" },
      })
    end,
  },
}
