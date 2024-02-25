return {
  "iabdelkareem/csharp.nvim",
  ft = { "cs", "fsharp" },
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "Tastyep/structlog.nvim",
  },
  config = function()
    require("mason").setup() -- Mason setup must run before csharp
    require("csharp").setup()
  end,
}
