return {
  "nvim-neotest/neotest",
  cmd = "Neotest",
  dependencies = {
    "nvim-neotest/neotest-go",
    "mrcjkb/rustaceanvim",
    "Issafalcon/neotest-dotnet",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
  },
  keys = {
    {
      "<leader>td",
      function() require("neotest").run.run({ strategy = "dap" }) end,
      desc = "Debug Nearest",
    },
    {
      "<leader>tt",
      function() require("neotest").run.run(vim.fn.expand("%")) end,
      desc = "Run File",
    },
    {
      "<leader>tT",
      function() require("neotest").run.run(vim.loop.cwd()) end,
      desc = "Run All Test Files",
    },
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    {
      "<leader>to",
      function() require("neotest").output.open({ enter = true, auto_close = true }) end,
      desc = "Show Output",
    },
    {
      "<leader>tO",
      function() require("neotest").output_panel.toggle() end,
      desc = "Toggle Output Panel",
    },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
  },
  opts = {
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function() vim.cmd("copen") end,
    },
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    -- Example for loading neotest-go with a custom config
    -- adapters = {
    --   ["neotest-go"] = {
    --     args = { "-tags=integration" },
    --   },
    -- },
    adapters = {
      ["neotest-go"] = {
        args = { "-tags=integration" },
      },
      ["rustaceanvim.neotest"] = {},
      ["neotest-dotnet"] = {},
      ["neotest-jest"] = {},
      ["neotest-vitest"] = {},
    },
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

    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        if type(name) == "number" then
          if type(config) == "string" then config = require(config) end
          adapters[#adapters + 1] = config
        elseif config ~= false then
          local adapter = require(name)
          if type(config) == "table" and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif meta and meta.__call then
              adapter(config)
            else
              error("Adapter " .. name .. " does not support setup")
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    require("neotest").setup(opts)
  end,
}
