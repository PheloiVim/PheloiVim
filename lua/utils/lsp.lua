local M = {}

--- Disables a server configuration.
--- This function disables the configuration for a specified language server in the Lazy framework.
--- @param server string: The name of the language server to disable.
function M.disable(server)
  local configs = require("lspconfig.configs")
  local def = rawget(configs, server)
  def.document_config.on_new_config = require("lspconfig.util").add_hook_before(
    def.document_config.on_new_config,
    function(config) config.enabled = false end
  )
end

return M
