return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePost", "VeryLazy" },
  opts = {
    ignore = "^$",
  },
}
