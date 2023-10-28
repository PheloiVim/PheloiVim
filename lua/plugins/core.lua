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
      local mode = {
        "mode",
        fmt = function(mode)
          return "-- " .. mode .. " --"
        end,
      }

      local branch = {
        "branch",
        icon = "",
        padding = 1.5,
      }

      local spaces = {
        function()
          return "Tab size: " .. vim.api.nvim_get_option_value("shiftwidth", {
            scope = "local",
          })
        end,
        padding = 1.5,
      }

      local progress = {
        "progress",
        fmt = function()
          return "%P/%L"
        end,
      }

      opts.options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      }
      opts.sections.lualine_a = { mode }
      opts.sections.lualine_b = { branch }
      opts.sections.lualine_y = { spaces }
      opts.sections.lualine_z = { progress }
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
    "nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "scss",
      })
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
