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

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("prettier")
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
      })
    end,
  },
}
