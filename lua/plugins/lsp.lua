return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      bashls = {},
      cssls = {},
      html = {},
      omnisharp = {},
    },
    diagnostics = {
      update_in_insert = true,
    },
  },
}
