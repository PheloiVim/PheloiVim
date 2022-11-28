local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

require "lsp.mason"
require ("lsp.handlers").setup()
require "lsp.null-ls"
