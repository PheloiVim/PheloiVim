return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "bash" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_formatter("shfmt")
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        sh = { "shfmt" },
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      require("pheloivim.utils").install_linter("shellcheck")
      opts.linters_by_ft = {
        sh = { "shellcheck" },
      }
    end,
  },
}
