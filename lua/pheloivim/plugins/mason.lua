return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  keys = {
    { "<leader>pm", "<cmd>Mason<cr>", desc = "Mason" },
  },
  opts = {
    ensure_installed = {},
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

    local function install_package(package_name)
      local registry = require("mason-registry")
      local Optional = require("mason-core.optional")
      local p = require("mason-core.package")
      local source, version = p.Parse(package_name)

      Optional.of_nilable(source)
        :map(function(source_name)
          local ok, pkg = pcall(registry.get_package, source_name)
          if ok then return pkg end
        end)
        :if_present(function(pkg)
          if not pkg:is_installed() then
            vim.notify(("[pheloivim-mason] installing %s"):format(pkg.name))
            pkg
              :install({
                version = version,
              })
              :once(
                "closed",
                vim.schedule_wrap(function()
                  if pkg:is_installed() then vim.notify(("[pheloivim-mason] %s was installed"):format(pkg.name)) end
                end)
              )
          end
        end)
        :or_else(function(pkg) vim.notify(("[pheloivim-mason] %s is not exist"):format(pkg.name)) end)
    end

    local added = {}
    opts.ensure_installed = vim.tbl_filter(function(tool)
      if added[tool] then return false end
      added[tool] = true
      return true
    end, opts.ensure_installed)

    for _, tool in ipairs(opts.ensure_installed) do
      install_package(tool)
    end
  end,
}
