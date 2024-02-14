return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.code_actions.gomodifytags,
      nls.builtins.code_actions.impl,
    })
  end,
}
