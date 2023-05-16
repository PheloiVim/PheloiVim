local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)
M.capabilities.offsetEncoding = { "UTF-8" }

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "󰅙" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "󰌵" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text })
  end

  vim.diagnostic.config {
    enabled = true,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "",
    },
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      source = "always",
    },
  }
end

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
    vim.opt_local.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end
end

return M
