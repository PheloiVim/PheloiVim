return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "hadolint" }) end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "dockerfile" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dockerls = {},
        docker_compose_language_service = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
      },
    },
  },
}
