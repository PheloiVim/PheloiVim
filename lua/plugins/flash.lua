return {
  "folke/flash.nvim",
  event = "CmdLineEnter",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "S", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    "f",
    "F",
  },
}
