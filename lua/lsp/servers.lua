-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "lua_ls", -- Lua lsp
  "html", -- HTML lsp
  "emmet_ls", -- Emmet support
  "cssls", -- CSS lsp
  "tsserver", -- JavaScript, TypeScript lsp
  "clangd", -- C, C++ lsp
  "bashls", -- Bash lsp
  "rust_analyzer", -- Rust lsp
  "jsonls",
  "eslint",
  "tailwindcss",
  "jdtls",
}

return servers
