return {
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = true,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "  ",
          selection_caret = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.6,
              results_width = 0.4,
            },
            width = 0.9,
            height = 0.8,
            preview_cutoff = 120,
          },
          pickers = {
            find_files = {
              theme = "dropdown",
            },
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { ".git/", "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["<CR>"] = actions.select_default,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
      local hl = vim.api.nvim_set_hl
      local mainColor = "#0F1211"
      hl(0, "TelescopeBorder", { fg = mainColor, bg = mainColor })
      hl(0, "TelescopeNormal", { bg = mainColor })

      hl(0, "TelescopePromptPrefix", { fg = "white", bg = mainColor })
      hl(0, "TelescopePromptNormal", { fg = "white", bg = mainColor })
      hl(0, "TelescopePromptBorder", { fg = mainColor, bg = mainColor })

      hl(0, "TelescopePreviewTitle", { fg = "black", bg = "#00FFC1" })
      hl(0, "TelescopeResultsTitle", { fg = "black", bg = "#FFEC00" })
      hl(0, "TelescopePromptTitle", { fg = "black", bg = "#FF2D00" })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return {
        options = {
          numbers = "none",
          left_mouse_command = "buffer %d",
          buffer_close_icon = "✗",
          modified_icon = "●",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 21,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = true,
          color_icons = true,
          offsets = { { filetype = "neo-tree", padding = 0, separator = true, text = "Neo Tree" } },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
        },
      }
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = true,
      check_ts = true,
      disable_filetype = { "TelescopePrompt" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false, -- Toggle with: Gitsigns toggle_numhl
      linehl = false, -- Toggle with: Gitsigns toggle_linehl
      word_diff = false, -- Toggle with: Gitsigns toggle_word_diff
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eog",
        delay = 1000,
        ignore_whitespace = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-e>", "<cmd>Neotree<cr>" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = false,
      sources = { "filesystem", "buffers", "git_status" },
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = " File" },
          { source = "git_status", display_name = "󰊢 Git" },
        },
      },
      window = {
        width = 35,
        mappings = {
          ["<space>"] = false,
          ["["] = "prev_source",
          ["]"] = "next_source",
          ["o"] = "open",
        },
      },
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = { padding = 0, indent_size = 1 },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        modified = { symbol = "" },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.neo_tree_remove_legacy_commands = true
      require("neo-tree").setup(opts)
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local mode = {
        "mode",
        fmt = function(str)
          return "-- " .. str .. " --"
        end,
      }

      local location = {
        "location",
        separator = "|",
        padding = 2,
        color = { fg = "white" },
      }

      local encoding = {
        "encoding",
        fmt = string.upper,
        separator = "|",
        padding = 2,
        color = { fg = "white" },
      }

      local diagnostics = {
        "diagnostics",
        symbols = { error = " ", warn = " ", hint = " " },
        sections = { "error", "warn", "hint" },
        colored = true,
        always_visible = true,
        update_in_insert = true,
        padding = 2,
      }

      local filetype = {
        "filetype",
        icon_only = true,
        padding = { left = 2 },
      }

      local branch = {
        "branch",
        icon = { "", color = { fg = "orange" } },
        color = { fg = "white" },
        padding = 2,
      }

      local diff = {
        function()
          if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
            return ""
          end

          local git_status = vim.b.gitsigns_status_dict

          local added = function()
            if git_status.added == 0 then
              return ""
            end
            return " " .. git_status.added
          end
          local changed = function()
            if git_status.changed == 0 then
              return ""
            end
            return "  " .. git_status.changed
          end
          local removed = function()
            if git_status.removed == 0 then
              return ""
            end
            return "  " .. git_status.removed
          end

          return added() .. changed() .. removed()
        end,
        color = { fg = "white" },
      }

      local spaces = {
        function()
          return "Tab size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        padding = 2,
        color = { fg = "white" },
      }

      local progress = {
        "progress",
        fmt = function()
          return "%P/%L"
        end,
      }

      local lsp_info = {
        function()
          local buf_clients = vim.lsp.buf_get_clients()
          local buf_client_names = {}

          local list_registered = function(fileType)
            local null_ls = require("null-ls.sources")
            local available_sources = null_ls.get_available(fileType)
            local registered = {}
            for _, source in ipairs(available_sources) do
              for method in pairs(source.methods) do
                registered[method] = registered[method] or {}
                table.insert(registered[method], source.name)
              end
            end
            return registered
          end

          local list_formatters = function(fileType)
            local registered_providers = list_registered(fileType)
            return registered_providers[require("null-ls").methods.FORMATTING] or {}
          end

          if next(buf_clients) == nil then
            return "No Active LSP"
          end
          for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" then
              table.insert(buf_client_names, client.name)
            end
          end

          vim.list_extend(buf_client_names, list_formatters(vim.bo.filetype))

          local unique_client_names = vim.fn.uniq(buf_client_names)
          return "|   LSP: " .. table.concat(unique_client_names, ", ")
        end,
        color = { fg = "white" },
        padding = { right = 2 },
      }

      return {
        options = {
          icons_enabled = true,
          theme = "tokyonight",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            "neo-tree",
            "lazy",
            "lspsagaoutline",
            "dapui_console",
            "dap-repl",
            "dapui_watches",
            "dapui_stacks",
            "dapui_breakpoints",
            "dapui_scopes",
            "mason",
            "TelescopePrompt",
            "help",
          },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch, diff },
          lualine_c = { diagnostics },
          lualine_x = { lsp_info },
          lualine_y = { location, filetype, encoding, spaces },
          lualine_z = { progress },
        },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      show_current_context_start = false,
      char = "│",
      colored_indent_levels = true,
      show_trailing_blankline_indent = true,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "lazy",
        "alpha",
      },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      sync_install = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "bash",
        "html",
        "css",
        "javascript",
        "java",
        "rust",
        "cpp",
        "c",
        "yaml",
        "typescript",
        "json",
        "luap",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = false,
        },
        lsp_interop = {
          enable = true,
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
