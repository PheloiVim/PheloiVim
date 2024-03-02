return {
  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    event = "BufWritePre",
    keys = {
      {
        "<leader>cf",
        function() require("conform").format() end,
        desc = "Format",
      },
    },
    opts = {
      format = {
        timeout_ms = 1000,
        async = true,
        quiet = false,
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
}
