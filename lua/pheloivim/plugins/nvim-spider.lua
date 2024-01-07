return {
  "chrisgrieser/nvim-spider",
  keys = {
    { "e", mode = { "n", "o", "x" }, function() require("spider").motion("e") end },
    { "w", mode = { "n", "o", "x" }, function() require("spider").motion("w") end },
    { "b", mode = { "n", "o", "x" }, function() require("spider").motion("b") end },
  },
}
