local M = {}

--- Checks if a plugin is available.
--- This function checks if a specified plugin is available in the `lazy.nvim` configuration.
--- @param plugin string The name of the plugin to check for availability.
--- @return boolean true if the plugin is available, false otherwise.
function M.has(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

return M
