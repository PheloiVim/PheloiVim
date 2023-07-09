return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local formatting = require("null-ls").builtins.formatting
    -- local diagnostics = require("null-ls").builtins.diagnostics
    -- local code_actions = require("null-ls").builtins.code_actions

    require("null-ls").setup {
      debug = false,
      sources = {
        formatting.prettierd,
        formatting.taplo, -- TOML
        formatting.shfmt, -- Bash/Shell
        formatting.stylua, -- Lua
        formatting.clang_format.with {
          filetypes = {
            "c",
            "cpp",
            "cs",
            "cuda",
            "proto",
          },
        }, -- C/C++
        formatting.rustfmt, -- Rust
        formatting.google_java_format, -- Java
      },
    }
  end,
}
