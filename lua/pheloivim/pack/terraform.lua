return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "terraform", "hcl" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {},
        tflint = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        terraform = { "terraform_validate" },
        tf = { "terraform_validate" },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
    },
  },
}
