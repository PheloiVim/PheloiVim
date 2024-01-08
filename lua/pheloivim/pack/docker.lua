return {
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
    opts = function(_, opts)
      require("pheloivim.utils").install_linter("hadolint")
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft, {
        dockerfile = { "hadolint" },
      })
    end,
  },
}
