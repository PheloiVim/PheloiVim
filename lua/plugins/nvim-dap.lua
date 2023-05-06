return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {
        expand_lines = true,
        force_buffers = false,
        element_mappings = {
          scopes = {
            edit = "l",
          },
        },
        icons = { expanded = "", collapsed = "", circular = "" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.45 },
              { id = "console", size = 0.55 },
            },
            size = 0.25,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          -- Display controls in this element
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
          },
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5, -- Floats will be treated as percentage of your screen.
          border = "rounded",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 3, -- Can be integer or nil.
        },
      },
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
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
