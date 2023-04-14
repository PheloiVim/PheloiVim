return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require "lsp.servers"
    require("lsp.handlers").setup()
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = " ",
            package_pending = " ",
            package_uninstalled = " ",
          },
        },
      },
    },
    { "williamboman/mason-lspconfig.nvim" },
    {
      "j-hui/fidget.nvim",
      opts = {
        window = {
          blend = 0,
        },
        text = {
          spinner = "pipe",
          done = "",
        },
        timer = {
          spinner_rate = 200,
        },
      },
    },
  },
}
