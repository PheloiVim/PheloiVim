return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      ---@diagnostic disable-next-line: missing-fields
      { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest" },
    },
  },

  {
    "nvim-neotest/neotest",
    cmd = "Neotest",
    keys = {
      { "<leader>tt", "<cmd>Neotest run file<cr>", desc = "Run File" },
      { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
      { "<leader>tr", "<cmd>Neotest run last<cr>", desc = "Run Nearest" },
      { "<leader>ts", "<cmd>Neotest summary<cr>", desc = "Toggle Summary" },
      { "<leader>to", "<cmd>Neotest output<cr>", desc = "Show Output" },
      { "<leader>tO", "<cmd>Neotest output-panel<cr>", desc = "Toggle Output Panel" },
      { "<leader>tS", "<cmd>Neotest stop<cr>", desc = "Stop" },
    },
    opts = {
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function() vim.cmd("copen") end,
      },
      adapters = {},
    },
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            -- Replace newline and tab characters with space for more compact diagnostics
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      require("neotest").setup(opts)
    end,
  },
}
