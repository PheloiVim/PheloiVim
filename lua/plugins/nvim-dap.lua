return {
  "mfussenegger/nvim-dap",
  config = function()
    vim.api.nvim_set_hl(0, "DapStoppedLinehl", { bg = "#555530" })
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    -- stylua: ignore
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError", linehl = "DapStoppedLinehl", numhl = "" })
    vim.fn.sign_define("DapStopped", { texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" })
    -- stylua: ignore
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

    -- C/C++, Rust debugger
    require "daps.adapters.codelldb"
    require "daps.languages.cpp"
    require "daps.languages.c"
  end,
}
