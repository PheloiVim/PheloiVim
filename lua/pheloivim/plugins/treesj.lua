return {
  "Wansmer/treesj",
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  keys = {
    { "<leader>m", function() require("treesj").toggle() end, desc = "Toggle node" },
  },
  opts = {},
}
