return {
  "nvim-telescope/telescope.nvim",
  keys = require("core.keymaps").Telescope,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = function()
    local actions = require "telescope.actions"
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
    require("telescope").load_extension "fzf"
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
}
