return {
  {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = "ConformInfo",
    event = { "BufWritePre" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format()
        end,
        desc = "Format code",
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
