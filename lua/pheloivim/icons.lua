return {
  git = {
    added = " ",
    modified = " ",
    conflict = "",
    ignored = "◌",
    renamed = "➜",
    removed = " ",
    branch = "",
    untracked = "★",
    staged = "✓",
    unstaged = "✗",
  },
  diagnostics = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " ",
  },
  dap = {
    Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = { " ", "DiagnosticInfo" },
    BreakpointCondition = { " ", "DiagnosticInfo" },
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = { ".>", "DiagnosticInfo" },
  },
}
