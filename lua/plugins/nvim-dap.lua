return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path() .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end
    for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      if not dap.configurations[language] then
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end
  end,
  dependencies = {
    { "leoluz/nvim-dap-go", opts = {} },

    {
      "rcarriga/nvim-dap-ui",
      keys = {
        { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
        {
          "<leader>de",
          function() require("dapui").eval() end,
          desc = "Eval",
          mode = { "n", "v" },
        },
      },
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {
        commented = true,
        enabled = true,
        enabled_commands = true,
      },
    },

    {
      "Weissle/persistent-breakpoints.nvim",
      opts = {
        load_breakpoints_event = { "BufReadPost" },
      },
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        automatic_installation = true,
        handlers = {}, -- Automatic Setup
        ensure_installed = {
          "bash",
          "codelldb",
          "coreclr",
          "js",
          "delve",
        },
      },
    },
  },
  keys = {
    {
      "<leader>dB",
      function() require("persistent-breakpoints.api").set_conditional_breakpoint() end,
      desc = "Conditional Breakpoint",
    },
    {
      "<leader>dd",
      function() require("persistent-breakpoints.api").clear_all_breakpoints() end,
      desc = "Clear Breakpoints",
    },
    {
      "<leader>db",
      function() require("persistent-breakpoints.api").toggle_breakpoint() end,
      desc = "Toggle Breakpoint",
    },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
  config = function()
    local icons = require("icons")
    for name, sign in pairs(icons.dap) do
      vim.fn.sign_define("Dap" .. name, { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] })
    end
  end,
}
