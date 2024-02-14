return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = {
    { "<leader>cf", function() require("conform").format() end, desc = "Format" },
  },
  opts = {
    format = {
      timeout_ms = 3000,
      async = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}
