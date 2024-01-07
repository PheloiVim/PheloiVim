return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      pre_hook = function(...)
        local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        if loaded and ts_comment then return ts_comment.create_pre_hook()(...) end
      end,
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
    config = function(_, opts) require("ts_context_commentstring").setup(opts) end,
  },
}
