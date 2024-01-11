return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    require("pheloivim.utils").install_package("prettier")
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      handlebars = { "prettier" },
    })
  end,
}
