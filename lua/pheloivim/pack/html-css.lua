return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "html", "css", "scss" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        emmet_ls = {},
      },
    },
  },
}
