local M = {}

local function resolve_package(package_name)
  local registry = require("mason-registry")
  local Optional = require("mason-core.optional")

  return Optional.of_nilable(package_name):map(function(source_name)
    local ok, pkg = pcall(registry.get_package, source_name)
    if ok then return pkg end
  end)
end

function M.install_formatter(fmt_name)
  local fmt_to_package = {}
  local p = require("mason-core.package")
  local package_name = fmt_to_package[fmt_name] or fmt_name
  local source, version = p.Parse(package_name)

  resolve_package(source):if_present(function(pkg)
    if not pkg:is_installed() then
      vim.notify(("[pheloivim-mason] installing %s formatter"):format(pkg.name))
      pkg:install({ version = version })
    end
  end)
end

function M.install_linter(linter_name)
  local linter_to_package = {
    golangcilint = "golangci-lint",
  }
  local p = require("mason-core.package")
  local package_name = linter_to_package[linter_name] or linter_name
  local source, version = p.Parse(package_name)

  resolve_package(source):if_present(function(pkg)
    if not pkg:is_installed() then
      vim.notify(("[pheloivim-mason] installing %s linter"):format(pkg.name))
      pkg:install({ version = version })
    end
  end)
end

return M
