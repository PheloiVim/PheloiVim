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
      config = function()
        require("mason").setup {
          ui = {
            icons = {
              package_installed = " ",
              package_pending = " ",
              package_uninstalled = " ",
            },
          },
        }
      end,
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "folke/trouble.nvim", config = true },
    {
      "RRethy/vim-illuminate",
      config = function()
        require("illuminate").configure {
          providers = {
            "lsp",
            "treesitter",
            "regex",
          },
          delay = 200,
          filetypes_denylist = {
            "lazy",
            "help",
            "lspinfo",
            "NvimTree",
            "TelescopePrompt",
            "Trouble",
            "toggleterm",
          },
        }
      end,
    },
    {
      "glepnir/lspsaga.nvim",
      config = function()
        require("lspsaga").setup {
          diagnostic = {
            on_insert = false,
            on_insert_follow = false,
            show_virt_line = false,
            show_code_action = false,
          },
          outline = {
            win_width = 40,
            keys = {
              jump = "o",
              expand_collapse = "u",
              quit = "q",
            },
          },
          symbol_in_winbar = {
            separator = "  ",
            show_file = false,
          },
        }
      end,
    },
    {
      "j-hui/fidget.nvim",
      config = function()
        local fidget = require "fidget"
        fidget.setup {
          text = {
            spinner = "pipe",
            done = "",
          },
          timer = {
            spinner_rate = 200,
          },
        }
      end,
    },
  },
}
