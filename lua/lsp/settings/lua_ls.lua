return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}
