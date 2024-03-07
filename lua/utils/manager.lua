local M = {}

---Install a package using Mason
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
      if ok then
        return pkg
      end
    end)
    :if_present(function(pkg)
      if not pkg:is_installed() then
        vim.notify(("installing %s"):format(pkg.name), vim.log.levels.INFO, { title = "mason.nvim" })
        pkg:install():once("closed", function()
          vim.notify(("%s was installed"):format(pkg.name), vim.log.levels.INFO, { title = "mason.nvim" })
        end)
      end
    end)
end

return M
