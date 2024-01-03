return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      ---@diagnostic disable-next-line
      servers = {
        eslint = {
          ---@diagnostic disable-next-line
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },
}
