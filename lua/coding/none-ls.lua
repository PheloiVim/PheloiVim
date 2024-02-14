return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- Go
      nls.builtins.code_actions.gomodifytags,
      nls.builtins.code_actions.impl,

      -- Nix
      nls.builtins.code_actions.statix,
      nls.builtins.formatting.alejandra,
      nls.builtins.diagnostics.deadnix,
    })
  end,
}
