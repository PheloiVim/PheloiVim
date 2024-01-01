return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  dependencies = { "mason.nvim" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format()
      end,
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
  config = function(_, opts)
    local formatters = {}

    for _, list_formatters in pairs(opts.formatters_by_ft) do
      for _, fmt in ipairs(list_formatters) do
        table.insert(formatters, fmt)
      end
    end

    for _, fmt in pairs(formatters) do
      require("pheloivim.utils").install_package(fmt)
    end

    require("conform").setup(opts)
  end,
}
