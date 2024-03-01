return {
  git = {
    added = " ",
    modified = " ",
    deleted = " ",
    renamed = "➜",
    untracked = "★",
    ignored = "◌",
    unstaged = "✗",
    staged = "✓",
    conflict = "",
    branch = "",
  },
  diagnostic = {
    error = " ",
    hint = "󰌵 ",
    info = "󰋼 ",
    warn = " ",
  },
  dap = {
    Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = { " ", "DapBreakpoint" },
    BreakpointCondition = { " ", "DapBreakpointCondition" },
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = { ".>", "DapLogPoint" },
  },
}
