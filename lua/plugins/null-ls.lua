return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    local formatting = require("null-ls").builtins.formatting
    -- local diagnostics = require("null-ls").builtins.diagnostics
    -- local code_actions = require("null-ls").builtins.code_actions

    return {
      debug = false,
      sources = {
        formatting.prettierd.with {
          filetypes = {
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "yaml",
            "markdown",
            "markdown.mdx",
            "graphql",
            "handlebars",
            "jsonc",
          },
        },
        formatting.taplo, -- TOML
        formatting.shfmt, -- Bash/Shell
        formatting.stylua, -- Lua
        formatting.clang_format, -- C/C++
        formatting.rustfmt, -- Rust
        formatting.rome, -- JavaScript, TypeScript, JSON
      },
    }
  end,
}
