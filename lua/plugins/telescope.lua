return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>ft", function() vim.cmd("Telescope live_grep") end, desc = "Find text" },
    { "<leader>ff", function() vim.cmd("Telescope find_files") end, desc = "Find Files" },
    { "<leader>fr", function() vim.cmd("Telescope oldfiles") end, desc = "Recent" },
    { "<leader>fu", function() vim.cmd("Telescope undo") end, desc = "Find undos" },
    { "<leader>gh", function() vim.cmd("Telescope git_commits") end, desc = "Commits history" },
    { "<leader>gs", function() vim.cmd("Telescope git_status") end, desc = "Status" },
    { "<leader>sb", function() vim.cmd("Telescope current_buffer_fuzzy_find") end, desc = "Buffer" },
    { "<leader>sm", function() vim.cmd("Telescope man_pages") end, desc = "Man Pages" },
  },
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "debugloop/telescope-undo.nvim",
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
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
  end,
}
