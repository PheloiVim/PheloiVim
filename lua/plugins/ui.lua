return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
          border = "none",
          zindex = 45,
          max_width = 0,
          max_height = 0,
          x_padding = 1,
          y_padding = 0,
          align = "bottom",
          relative = "editor",
        },
      },
    },
  },

  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    opts = {},
    config = function(_, opts)
      require("tokyodark").setup(opts)
      vim.cmd.colorscheme("tokyodark")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = { show_start = false, show_end = false, show_exact_scope = false },
      exclude = {
        buftypes = {
          "nofile",
          "terminal",
        },
        filetypes = {
          "help",
          "dashboard",
          "lazy",
          "neo-tree",
          "Trouble",
          "toggleterm",
          "mason",
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      {
        "<leader>bp",
        function()
          vim.cmd("BufferLineTogglePin")
        end,
        desc = "Toggle pin",
      },
      {
        "<leader>bP",
        function()
          vim.cmd("BufferLineGroupClose ungrouped")
        end,
        desc = "Delete non-pinned buffers",
      },
      {
        "<leader>bo",
        function()
          vim.cmd("BufferLineCloseOthers")
        end,
        desc = "Delete other buffers",
      },
      {
        "<leader>br",
        function()
          vim.cmd("BufferLineCloseRight")
        end,
        desc = "Delete buffers to the right",
      },
      {
        "<leader>bl",
        function()
          vim.cmd("BufferLineCloseLeft")
        end,
        desc = "Delete buffers to the left",
      },
      {
        "<S-h>",
        vim.cmd.BufferLineCyclePrev,
        desc = "Prev buffer",
      },
      {
        "<S-l>",
        vim.cmd.BufferLineCycleNext,
        desc = "Next buffer",
      },
    },
    opts = function()
      return {
        options = {
          close_command = function(n)
            require("mini.bufremove").delete(n, false)
          end,
          right_mouse_command = function(n)
            require("mini.bufremove").delete(n, false)
          end,
          diagnostics = "nvim_lsp",
          always_show_bufferline = true,
          diagnostics_indicator = function(_, _, diag)
            local icons = require("icons").diagnostic
            local ret = (diag.error and icons.error .. diag.error .. " " or "")
              .. (diag.warning and icons.warn .. diag.warning or "")
            return vim.trim(ret)
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      }
    end,
    init = function()
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  {
    "stevearc/dressing.nvim",
    init = function()
      for _, func in pairs({ "input", "select" }) do
        vim.ui[func] = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui[func](...)
        end
      end
    end,
    opts = {
      input = { default_prompt = "➤ " },
    },
  },

  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      filetypes_denylist = {
        "Trouble",
        "trouble",
        "qf",
        "lazy",
        "dashboard",
        "mason",
        "neo-tree",
        "notify",
      },
      delay = 200,
      large_file_cutoff = 2000,
      min_count_to_highlight = 2,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
    keys = {
      {
        "]r",
        function()
          require("illuminate")["goto_next_reference"](false)
        end,
        desc = "Next Reference",
      },
      {
        "[r",
        function()
          require("illuminate")["goto_prev_reference"](false)
        end,
        desc = "Prev Reference",
      },
      {
        "<leader>uR",
        function()
          require("illuminate").toggle_buf()
        end,
        desc = "Toggle reference highlighting",
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
        inc_rename = false,
      },
    },
    keys = {
      {
        "<leader>nl",
        function()
          require("noice").cmd("last")
        end,
        desc = "Last Message",
      },
      {
        "<leader>nh",
        function()
          require("noice").cmd("history")
        end,
        desc = "History",
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>nd",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require
      local icons = require("icons")

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          icons_enabled = true,
          always_divide_middle = true,
          theme = "auto",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
        },
        extensions = {
          "quickfix",
          "lazy",
          "neo-tree",
          "mason",
          "trouble",
          "nvim-dap-ui",
          "toggleterm",
          "man",
          "fugitive",
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(mode)
                return " " .. mode
              end,
            },
          },
          lualine_b = {},
          lualine_c = {
            { "branch", icon = icons.git.branch, color = { fg = "pink" } },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.deleted,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_x = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = { fg = "pink" },
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = { fg = "pink" },
            },
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = { fg = "pink" },
            },
            {
              "diagnostics",
              symbols = icons.diagnostic,
            },
            {
              function()
                local clients = vim.lsp.get_active_clients({ bufnr = 0 })
                local client_names = {}
                for _, client in ipairs(clients) do
                  if client.name ~= "null-ls" then
                    table.insert(client_names, client.name)
                  end
                end

                local pretty_list_clients = #client_names ~= 0 and table.concat(client_names, ", ")
                return "[" .. pretty_list_clients .. "]"
              end,
              color = { fg = "pink" },
              padding = 0,
            },
            {
              function()
                local formatters = require("conform").list_formatters(0)
                local available_formatters = {}
                for _, fmt in ipairs(formatters) do
                  if fmt.available then
                    table.insert(available_formatters, fmt.name)
                  end
                end

                local pretty_list_formatters = #available_formatters ~= 0 and table.concat(available_formatters, ", ")
                return "[" .. pretty_list_formatters .. "]"
              end,
              color = { fg = "pink" },
              padding = 0,
            },
          },
          lualine_y = {
            {
              function()
                return "Tab size: " .. vim.api.nvim_get_option_value("shiftwidth", { scope = "local" })
              end,
            },
          },
          lualine_z = {
            {
              "progress",
              fmt = function()
                return "%P/%L"
              end,
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
