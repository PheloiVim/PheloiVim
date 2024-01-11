return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "zig" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {},
      },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = "lawrence-laz/neotest-zig",
    opts = function(_, opts) vim.list_extend(opts.adapters, { require("neotest-zig") }) end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        zig = { "zigfmt" },
      },
    },
  },
}
