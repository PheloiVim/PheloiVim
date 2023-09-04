return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      bashls = {},
      cssls = {},
      html = {},
      omnisharp = {},
      emmet_ls = {},
    },
    diagnostics = {
      update_in_insert = true,
    },
  },
}
