return {
  "folke/flash.nvim",
  event = "CmdLineEnter",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
