return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "delve", "golangci-lint", "goimports", "gofumpt" }) end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "ray-x/guihua.lua",
    opts = {
      servers = {
        gopls = {
          keys = {
            n = {
              ["<leader>td"] = { cmd = function() require("dap-go").debug_test() end, desc = "Debug Nearest (Go)" },
            },
          },
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
          semanticTokens = true,
        },
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = { "leoluz/nvim-dap-go", opts = {} },
  },

  {
    "nvim-neotest/neotest",
    dependencies = "nvim-neotest/neotest-go",
    opts = function(_, opts) vim.list_extend(opts.adapters, { require("neotest-go") }) end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
        gomod = { "golangcilint" },
        gowork = { "golangcilint" },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },
}
