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

    for _, tool in ipairs(opts.ensure_installed) do
      require("pheloivim.utils.manager").install_package(tool)
    end
  end,
}
