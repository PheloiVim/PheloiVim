return {
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
    "noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },

  {
    "tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
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
    "nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load() -- Fix tab not work

      opts.window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:CmpPmenu",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:CmpDocumentation",
        },
      }
      opts.mapping = cmp.mapping.preset.insert({
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
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

  {
    "edgy.nvim",
    opts = {
      animate = {
        enabled = false,
      },
    },
  },
}
