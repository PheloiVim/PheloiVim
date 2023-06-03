return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "simrat39/rust-tools.nvim",
        config = function()
          local rt = require("rust-tools")
          rt.setup()
          rt.inlay_hints.enable()
        end,
      },
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
        cmd = { "LspInstall", "LspUninstall" },
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
        "SmiteshP/nvim-navic",
        opts = {
          highlight = true,
          separator = "   ",
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
    },
    config = function()
      require("lsp.servers")
      local signs = {
        { name = "DiagnosticSignError", text = "󰅙" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "󰌵" },
        { name = "DiagnosticSignInfo", text = "" },
      }
      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text })
      end
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
      vim.diagnostic.config({
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
      })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = function()
      return {
        ui = {
          kind = {
            File = { "󰈔 ", "LspKindFile" },
            Module = { " ", "LspKindModule" },
            Namespace = { " ", "LspKindNamespace" },
            Package = { " ", "LspKindPackage" },
            Class = { " ", "LspKindClass" },
            Method = { " ", "LspKindMethod" },
            Property = { " ", "LspKindProperty" },
            Field = { " ", "LspKindField" },
            Constructor = { " ", "LspKindConstructor" },
            Enum = { " ", "LspKindEnum" },
            Interface = { " ", "LspKindInterface" },
            Function = { "󰊕 ", "LspKindFunction" },
            Variable = { " ", "LspKindVariable" },
            Constant = { " ", "LspKindConstant" },
            String = { " ", "LspKindString" },
            Number = { "󰉻 ", "LspKindNumber" },
            Boolean = { " ", "LspKindBoolean" },
            Array = { " ", "LspKindArray" },
            Object = { "󰐾 ", "LspKindObject" },
            Key = { "󰌋 ", "LspKindKey" },
            Null = { "󰟢 ", "LspKindNull" },
            EnumMember = { " ", "LspKindEnumMember" },
            Struct = { " ", "LspKindStruct" },
            Event = { " ", "LspKindEvent" },
            Operator = { " ", "LspKindOperator" },
            TypeParameter = { " ", "LspKindTypeParameter" },
            TypeAlias = { " ", "LspKindTypeAlias" },
            Parameter = { " ", "LspKindParameter" },
            StaticMethod = { " ", "LspKindStaticMethod" },
            Macro = { " ", "LspKindMacro" },
            Text = { " ", "LspKindText" },
            Snippet = { " ", "LspKindSnippet" },
            Folder = { " ", "LspKindFolder" },
            Unit = { " ", "LspKindUnit" },
            Value = { " ", "LspKindValue" },
          },
          border = "single",
          code_action = "",
        },
        diagnostic = {
          on_insert = false,
          on_insert_follow = false,
          show_virt_line = false,
          show_code_action = false,
        },
        lightbulb = {
          enable = true,
        },
        outline = {
          win_width = 40,
          keys = {
            expand_or_jump = "o",
            quit = "q",
          },
        },
        hover = {
          max_width = 0.5,
        },
        code_action = {
          num_shortcut = true,
          show_server_name = true,
          extend_gitsigns = true,
          keys = {
            quit = "q",
            exec = "<CR>",
          },
        },
        symbol_in_winbar = {
          enable = false,
        },
      }
    end,
  },
}
