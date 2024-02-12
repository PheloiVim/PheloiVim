return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "luacheck", "stylua" }) end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "lua", "luadoc" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      { "folke/neoconf.nvim", opts = {} },
    },
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        lua_ls = require("lsp-zero").nvim_lua_ls(),
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        lua = { "luacheck" },
      },
    },
  },
}
