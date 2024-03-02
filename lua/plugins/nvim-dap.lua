return {
  -- Fancy UI for the debugger
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>du",
        function() require("dapui").toggle({}) end,
        desc = "Dap UI",
      },
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

  -- Virtual text for the debugger
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      commented = true,
      enabled = true,
      enabled_commands = true,
    },
  },

  -- Persistent breakpoints
  {
    "Weissle/persistent-breakpoints.nvim",
    opts = {
      load_breakpoints_event = { "BufReadPost" },
    },
  },

  -- Plugin for mason.nvim integration with debugger
  {
    "jay-babu/mason-nvim-dap.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
    opts = {
      automatic_installation = true,
      handlers = {}, -- Automatic Setup
      ensure_installed = {},
    },
  },

  -- Main DAP plugin for debugger functionality
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "Weissle/persistent-breakpoints.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
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
      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc = "Continue",
      },
      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function() require("dap").goto_() end,
        desc = "Go to line (no execute)",
      },
      {
        "<leader>di",
        function() require("dap").step_into() end,
        desc = "Step Into",
      },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      {
        "<leader>dl",
        function() require("dap").run_last() end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function() require("dap").step_out() end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function() require("dap").step_over() end,
        desc = "Step Over",
      },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      {
        "<leader>dr",
        function() require("dap").repl.toggle() end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function() require("dap").session() end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function() require("dap").terminate() end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function() require("dap.ui.widgets").hover() end,
        desc = "Widgets",
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      -- Define signs for debugger icons
      for name, sign in pairs(require("icons").dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define("Dap" .. name, {
          text = sign[1],
          texthl = sign[2] or "DiagnosticInfo",
          linehl = sign[3],
          numhl = sign[3],
        })
      end

      -- Load launch configurations from vscode
      require("dap.ext.vscode").load_launchjs()
    end,
  },
}
