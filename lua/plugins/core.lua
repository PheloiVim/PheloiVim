return {
  {
    "rust-tools.nvim",
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    },
  },

  {
    "lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections.lualine_a = {
        {
          "mode",
          fmt = function(mode)
            return " " .. mode
          end,
        },
      }
      opts.sections.lualine_y = {
        {
          function()
            return "Tab size: "
              .. vim.api.nvim_get_option_value("shiftwidth", {
                scope = "local",
              })
          end,
        },
      }
      opts.sections.lualine_z = {
        {
          "progress",
          fmt = function()
            return "%P/%L"
          end,
        },
      }
    end,
  },

  {
    "tokyonight.nvim",
    opts = {
      style = "night",
      on_highlights = function(hl, c)
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = c.bg,
        }
        hl.TelescopePromptBorder = {
          bg = c.bg,
          fg = c.bg,
        }
        hl.TelescopePromptTitle = {
          bg = c.bg,
          fg = c.bg,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    },
  },

  {
    "nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        cssls = {},
        html = {},
        volar = {},
      },
      inlay_hints = {
        enabled = true,
      },
      diagnostics = {
        update_in_insert = true,
      },
    },
  },

  {
    "mason.nvim",
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
    "neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["l"] = "open",
        },
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  {
    "nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "scss",
        "vue",
        "nix",
        "xml",
        "kotlin",
        "groovy",
        "java",
      })
    end,
  },

  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
    },
  },
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "google-java-format" })
    end,
  },

  {
    "telescope.nvim",
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
    },
  },

  {
    "vim-startuptime",
    enabled = false,
  },

  {
    "catppuccin",
    enabled = false,
  },

  {
    "dashboard-nvim",
    enabled = false,
  },

  {
    "mini.surround",
    enabled = false,
  },

  {
    "mini.ai",
    enabled = false,
  },

  {
    "mini.indentscope",
    enabled = false,
  },

  {
    "neodev.nvim",
    enabled = false,
  },

  {
    "persistence.nvim",
    enabled = false,
  },

  {
    "neoconf.nvim",
    enabled = false,
  },

  {
    "nvim-notify",
    enabled = false,
  },

  {
    "nvim-ts-autotag",
    enabled = false,
  },

  {
    "nvim-treesitter-context",
    enabled = false,
  },

  {
    "nvim-spectre",
    enabled = false,
  },

  {
    "vim-illuminate",
    enabled = false,
  },
}
