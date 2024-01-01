return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePost", "VeryLazy" },
  keys = {
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
  },
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  opts = function()
    local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook(), ignore = "^$" } or {}
  end,
}
