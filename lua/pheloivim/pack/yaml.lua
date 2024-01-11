return {
  "b0o/SchemaStore.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "yaml" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        yamlls = {
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              schemas = require("schemastore").yaml.schemas(),
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
            },
          },
        },
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("actionlint")
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft, {
        yaml = { "actionlint" },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("prettier")
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        yaml = { "prettier" },
      })
    end,
  },
}
