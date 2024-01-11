return {
  "b0o/SchemaStore.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        jsonls = {
          settings = {
            json = {
              format = { enable = true },
              validate = { enable = true },
              schemas = require("schemastore").json.schemas(),
            },
          },
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("prettier")
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        json = { { "biome", "prettier" } },
        jsonc = { { "biome", "prettier" } },
      })
    end,
  },
}
