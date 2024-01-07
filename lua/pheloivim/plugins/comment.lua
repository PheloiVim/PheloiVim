return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  opts = {
    pre_hook = function() return vim.bo.commentstring end,
  },
}
