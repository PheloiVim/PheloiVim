return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c_sharp",
        "css",
        "scss",
        "zig",
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },

  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      region_check_events = "InsertEnter,CursorMoved",
      delete_check_events = "TextChanged,InsertLeave",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      require("luasnip.loaders.from_snipmate").lazy_load()
      local cmp = require("cmp")
      opts.window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
        }),
      }
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 2, priority = 1000 },
        { name = "luasnip", keyword_length = 2, priority = 750 },
        { name = "buffer", keyword_length = 2, priority = 500 },
        { name = "path", keyword_length = 2, priority = 250 },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        bashls = {},
        cssls = {},
        html = {},
        omnisharp = {},
        zls = {},
      },
      diagnostics = {
        update_in_insert = true,
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
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
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local mode = {
        "mode",
        fmt = function(mode) return "-- " .. mode .. " --" end,
      }

      local branch = {
        "branch",
        icon = "",
        padding = 1.5,
      }

      local spaces = {
        function() return "Tab size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") end,
        padding = 1.5,
      }

      local progress = {
        "progress",
        fmt = function() return "%P/%L" end,
      }

      opts.options = {
        icons_enabled = true,
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
      }
      opts.sections.lualine_a = { mode }
      opts.sections.lualine_b = { branch }
      opts.sections.lualine_y = { spaces }
      opts.sections.lualine_z = { progress }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      window = {
        width = 30,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          l = "open",
        },
      },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "Issafalcon/neotest-dotnet",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {},
        ["neotest-dotnet"] = {},
      },
    },
  },

  -- disabled plugins
  {
    "folke/persistence.nvim",
    enabled = false,
  },

  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },

  {
    "dstein64/vim-startuptime",
    enabled = false,
  },

  {
    "catppuccin",
    enabled = false,
  },

  {
    "nvim-pack/nvim-spectre",
    enabled = false,
  },

  {
    "goolord/alpha-nvim",
    enabled = false,
  },

  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
}
