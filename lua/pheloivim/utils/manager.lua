local M = {}

--- Checks if a plugin is available.
--- This function checks if a specified plugin is available in the `lazy.nvim` configuration.
--- @param plugin string The name of the plugin to check for availability.
--- @return boolean true if the plugin is available, false otherwise.
function M.has(plugin) return require("lazy.core.config").spec.plugins[plugin] ~= nil end

--- Install a package using Mason
---@param package_name string
function M.install_package(package_name)
  local registry = require("mason-registry")
  local optional = require("mason-core.optional")
  local p = require("mason-core.package")
  local source = p.Parse(package_name)

  optional
    .of_nilable(source)
    :map(function(source_name)
      local ok, pkg = pcall(registry.get_package, source_name)
      if ok then return pkg end
    end)
    :if_present(function(pkg)
      if not pkg:is_installed() then
        vim.notify(("[pheloivim-mason] installing %s"):format(pkg.name), vim.log.levels.INFO)
        pkg:install():once(
          "closed",
          function() vim.notify(("[pheloivim-mason] %s was installed"):format(pkg.name), vim.log.levels.INFO) end
        )
      end
    end)
end

return M
