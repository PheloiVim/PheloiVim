return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    local formatting = require("null-ls").builtins.formatting
    -- local diagnostics = null_ls.builtins.diagnostics
    -- local code_actions = null_ls.builtins.code_actions

    return {
      debug = false,
      sources = {
        formatting.prettierd.with {
          filetypes = {
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "markdown.mdx",
            "graphql",
            "handlebars",
          },
        },
        formatting.taplo,
        formatting.shfmt,
        formatting.stylua,
        formatting.clang_format,
        formatting.rustfmt,
        formatting.rome,
      },
    }
  end,
}
