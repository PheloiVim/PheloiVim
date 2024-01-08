return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    filetypes_denylist = {
      "NvimTree",
      "Trouble",
      "trouble",
      "qf",
      "lazy",
      "dashboard"
    },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
