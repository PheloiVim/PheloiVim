local M = {}

---@param source_name string
---@return Optional
function M.resolve_package(source_name)
  local registry = require("mason-registry")
  local Optional = require("mason-core.optional")

  return Optional.of_nilable(source_name):map(function(package_name)
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

---@param name string
---@param fn fun(name:string)
function M.on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

return M
