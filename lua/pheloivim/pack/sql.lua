return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "sql" }) end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("sqlfluff")
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft, {
        sql = { "sqlfluff" },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("sqlfluff")
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        sql = { "sqlfluff" },
      })
    end,
  },
}
