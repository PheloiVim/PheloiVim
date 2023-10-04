return {
  {
    "nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "scss",
        "c_sharp",
      })
    end,
  },

  {
    "noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },

  {
    "catppuccin",
    opts = {
      term_colors = true,
      integrations = {
        mini = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        markdown = true,
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        symbols_outline = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
      },
    },
  },

  {
    "telescope.nvim",
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  {
    "LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "LuaSnip",
    opts = {
      region_check_events = "InsertEnter,CursorMoved",
      delete_check_events = "TextChanged,InsertLeave",
    },
  },

  {
    "nvim-cmp",
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
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "path", priority = 500 },
        { name = "buffer", priority = 250 },
      })
    end,
  },

  {
    "nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        bashls = {},
        cssls = {},
        html = {},
        omnisharp = {
          enable_ms_build_load_projects_on_demand = true,
        },
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
    "bufferline.nvim",
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
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
    "lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local icons = require("lazyvim.config").icons

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
        icons_enabled = true,
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
      }
      opts.sections.lualine_a = { mode }
      opts.sections.lualine_b = { branch }
      opts.sections.lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
      }
      opts.sections.lualine_y = { spaces }
      opts.sections.lualine_z = { progress }
    end,
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
    "neotest",
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {},
      },
    },
  },

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
    "nvim-navic",
    opts = {
      separator = " > ",
      depth_limit = 0,
    },
  },
}
