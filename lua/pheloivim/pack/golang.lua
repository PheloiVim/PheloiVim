return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "gowork",
        "gosum",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      for _, fmt in ipairs({ "goimports", "gofumpt" }) do
        require("pheloivim.utils").install_formatter(fmt)
      end

      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        go = { "goimports", "gofumpt" },
      })
    end,
  },

  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    ft = { "go", "gomod" },
    opts = {},
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = { "leoluz/nvim-dap-go", opts = {} },
    opts = function() require("pheloivim.utils").install_dap("delve") end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
    },
    opts = function(_, opts) vim.list_extend(opts.adapters, { require("neotest-go") }) end,
  },
}
