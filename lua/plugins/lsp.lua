return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      bashls = {
        setup = {},
      },
      cssls = {
        setup = {},
      },
      html = {
        setup = {},
      },
      omnisharp = {
        setup = {},
      },
    },
    diagnostics = {
      update_in_insert = true,
    },
  },
}
