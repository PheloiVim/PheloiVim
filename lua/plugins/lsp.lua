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
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        {
          ensure_installed = {
            "lua_ls",
            "html",
            "emmet_ls",
            "cssls",
            "tsserver",
            "rome",
            "bashls",
            "rust_analyzer",
            "jsonls",
          },
        },
      },
    },
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
    { "ray-x/lsp_signature.nvim" },
  },
}
