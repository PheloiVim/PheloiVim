local M = {}

---@param plugin string
function M.has(plugin) return require("lazy.core.config").spec.plugins[plugin] ~= nil end

return M
