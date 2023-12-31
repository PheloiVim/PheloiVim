return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    opts = {},
    config = function(_, opts) end,
  },
}
