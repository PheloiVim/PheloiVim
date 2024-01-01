return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function() require("conform").format() end,
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {},
  },
  config = function(_, opts)
    for _, list_formatters in pairs(opts.formatters_by_ft) do
      for _, fmt in ipairs(list_formatters) do
        require("pheloivim.utils").install_package(fmt)
      end
    end

    require("conform").setup(opts)
  end,
}
