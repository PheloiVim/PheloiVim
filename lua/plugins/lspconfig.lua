return {
  {
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
  -- Illuminate
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 200,
      filetypes_denylist = {
        "alpha",
        "lazy",
        "help",
        "lspinfo",
        "TelescopePrompt",
        "toggleterm",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
}