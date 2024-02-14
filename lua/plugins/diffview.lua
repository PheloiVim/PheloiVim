return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>gd", function() vim.cmd("DiffviewOpen") end, desc = "Open diff" },
    { "<leader>gr", function() vim.cmd("DiffviewRefresh") end, desc = "Refresh diff" },
    { "<leader>gf", function() vim.cmd("DiffviewFileHistory") end, desc = "File history" },
  },
  cmd = {
    "DiffviewOpen",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  opts = {},
}
