local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
local code_actions = require("null-ls").builtins.code_actions

require("null-ls").setup({
  debug = false,
  sources = {
    formatting.prettierd,
    formatting.taplo, -- TOML
    formatting.shfmt, -- Bash/Shell
    formatting.stylua, -- Lua
    formatting.clang_format, -- C/C++
    formatting.rustfmt, -- Rust
  },
})
