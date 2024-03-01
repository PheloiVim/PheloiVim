return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  opts = {
    ensure_installed = { "stylua" },
    ui = {
      icons = {
        package_installed = "✓",
        package_uninstalled = "✗",
        package_pending = "⟳",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    require("mason-registry"):on("package:install:success", function()
      vim.defer_fn(function()
        -- trigger FileType event to possibly load this newly installed LSP server
        require("lazy.core.handler.event").trigger({
          event = "FileType",
          buf = vim.api.nvim_get_current_buf(),
        })
      end, 100)
    end)

    for _, tool in ipairs(opts.ensure_installed) do
      require("utils.manager").install_package(tool)
    end
  end,
}
