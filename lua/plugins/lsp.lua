return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "󰗠 ",
            package_pending = " ",
            package_uninstalled = " ",
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
          "rome",
          "bashls",
          "rust_analyzer",
          "tsserver",
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
          spinner = { "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" },
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
          border = "single",
        },
      },
    },
    {
      "SmiteshP/nvim-navic",
      opts = {
        highlight = true,
        separator = "   ",
      },
    },
  },
  config = function()
    require "lsp.servers"
    local signs = {
      { name = "DiagnosticSignError", text = "󰅙" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "󰌵" },
      { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text })
    end
    vim.diagnostic.config {
      enabled = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "",
      },
      signs = {
        active = signs,
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        source = "always",
      },
    }
  end,
}
