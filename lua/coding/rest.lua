return {
  "rest-nvim/rest.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  ft = "http",
  keys = {
    { "<leader>ta", function() require("rest-nvim").run() end, desc = "Test API" },
  },
  config = function() require("rest-nvim").setup() end,
}
