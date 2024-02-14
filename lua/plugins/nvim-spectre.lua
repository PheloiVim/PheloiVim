return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    {
      "<leader>sw",
      mode = "v",
      function() require("spectre").open_visual() end,
      desc = "Search current word (Spectre)",
    },
  },
}
