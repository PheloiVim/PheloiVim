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
    dependencies = {
      "ray-x/guihua.lua",
      {
        "ray-x/go.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePost" },
        ft = { "go", "gomod" },
        opts = { lsp_cfg = false },
      },
    },
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        gopls = require("go.lsp").config(),
      })
    end,
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
}
