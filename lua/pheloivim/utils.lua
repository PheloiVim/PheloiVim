local M = {}

---@param source_name string
---@return Optional
function M.resolve_package(source_name)
  local name_to_package = {
    golangcilint = "golangci-lint",
    lua_ls = "lua-language-server",
  }
  local registry = require("mason-registry")
  local Optional = require("mason-core.optional")

  return Optional.of_nilable(name_to_package[source_name] or source_name):map(function(package_name)
    local ok, pkg = pcall(registry.get_package, package_name)
    if ok then return pkg end
  end)
end

---@param package_name string
function M.install_package(package_name)
  local p = require("mason-core.package")
  local source, version = p.Parse(package_name)

  M.resolve_package(source):if_present(function(pkg)
    if not pkg:is_installed() then
      vim.notify(("[pheloivim-mason] installing %s"):format(pkg.name))
      pkg:install({ version = version }):once(
        "closed",
        vim.schedule_wrap(function()
          if pkg:is_installed() then vim.notify(("[pheloivim-mason] %s was installed"):format(pkg.name)) end
        end)
      )
    end
  end)
end

return M
