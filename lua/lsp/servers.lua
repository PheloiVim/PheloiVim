-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "lua_ls", -- Lua lsp
  "html", -- HTML lsp
  "emmet_ls", -- Emmet support
  "cssls", -- CSS lsp
  "tsserver", -- JavaScript, TypeScript lsp
  "rome", -- JavaScript, TypeScript, JSON Linter & Formatter
  "clangd", -- C, C++ lsp
  "bashls", -- Bash lsp
  "rust_analyzer", -- Rust lsp
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }
  server = vim.split(server, ",")[1]
  local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end
  require("lspconfig")[server].setup(opts)
end
