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
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    event = { "CmdlineEnter" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/guihua.lua",
    },
    opts = {
      servers = {
        gopls = {},
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

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      require("pheloivim.utils").install_linter("golangci-lint")
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft, {
        go = { "golangcilint" },
        gomod = { "golangcilint" },
        gowork = { "golangcilint" },
      })
    end,
  },
}
