return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "delve", "golangci-lint" }) end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" }) end,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    event = { "CmdlineEnter" },
    opts = {},
    build = function() require("go.install").update_all_sync() end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "ray-x/guihua.lua",
    opts = {
      servers = {
        gopls = {},
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
}
