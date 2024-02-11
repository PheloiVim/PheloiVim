return {
  "ThePrimeagen/harpoon",
  cmd = { "Harpoon" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>fa", function() require("harpoon.mark").add_file() end, desc = "Add file" },
    { "<leader>fe", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
    { "<leader>fm", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
  },
}
