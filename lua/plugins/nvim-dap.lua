return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    opts = {
      expand_lines = true,
      icons = { expanded = "", collapsed = "", circular = "" },
      mappings = {
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
          position = "right",
        },
        {
          elements = {
            { id = "repl", size = 0.45 },
            { id = "console", size = 0.55 },
          },
          size = 0.27,
          position = "bottom",
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = "rounded",
        mappings = {
          close = { "q", "<Esc>" },
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
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    local sign = vim.fn.sign_define
    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

    -- C/C++, Rust debugger
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
  end,
}
