return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function() require("conform").format() end,
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {},
  },
}
