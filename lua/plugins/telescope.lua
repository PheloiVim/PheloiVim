return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = vim.fn.executable("make") == 1,
    build = "make",
    config = function() require("telescope").load_extension("fzf") end,
  },

  {
    "debugloop/telescope-undo.nvim",
    config = function() require("telescope").load_extension("undo") end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    keys = {
      { "<leader>ft", function() vim.cmd("Telescope live_grep") end, desc = "Find text" },
      { "<leader>ff", function() vim.cmd("Telescope find_files") end, desc = "Find Files" },
      { "<leader>fr", function() vim.cmd("Telescope oldfiles") end, desc = "Recent" },
      { "<leader>fu", function() vim.cmd("Telescope undo") end, desc = "Find undos" },
      { "<leader>gh", function() vim.cmd("Telescope git_commits") end, desc = "Commits history" },
      { "<leader>gS", function() vim.cmd("Telescope git_status") end, desc = "Status (Telescope)" },
      {
        "<leader>sb",
        function() vim.cmd("Telescope current_buffer_fuzzy_find") end,
        desc = "Buffer",
      },
      { "<leader>sm", function() vim.cmd("Telescope man_pages") end, desc = "Man Pages" },
    },
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
          horizontal = { preview_cutoff = 80, width = 0.9 },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    },
  },
}
