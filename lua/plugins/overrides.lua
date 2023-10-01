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
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
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
    "flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
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
      diagnostics = {
        update_in_insert = true,
      },
    },
  },

  {
    "bufferline.nvim",
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        always_show_bufferline = true,
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
          return "Tab size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
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
        {
          function()
            return require("nvim-navic").get_location()
          end,
          cond = function()
            return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
          end,
        },
      }
      opts.sections.lualine_y = { spaces }
      opts.sections.lualine_z = { progress }
    end,
  },

  {
    "neo-tree.nvim",
    opts = {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      popup_border_style = "rounded",
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
}
