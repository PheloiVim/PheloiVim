return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "terraform", "hcl" }) end,
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
}
