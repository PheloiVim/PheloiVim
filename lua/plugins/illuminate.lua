return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    filetypes_denylist = {
      "Trouble",
      "trouble",
      "qf",
      "lazy",
      "dashboard",
      "mason",
      "neo-tree",
      "notify",
    },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
