return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
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
    {
      "j-hui/fidget.nvim",
      opts = {
        window = {
          blend = 0,
        },
        text = {
          spinner = "dots",
          done = "",
        },
        timer = {
          spinner_rate = 200,
        },
      },
    },
    {
      "ray-x/lsp_signature.nvim",
      opts = {
        bind = true,
        close_timeout = 1000,
        floating_window_off_x = 0,
        floating_window_off_y = 0,
        handler_opts = {
          border = "rounded",
        },
      },
    },
  },
}
