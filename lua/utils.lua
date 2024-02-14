local M = {}

function M.root_dir(root_patterns)
  local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true, stop = vim.loop.os_homedir() })[1])
  return root_dir
end

function M.disable(server)
  local configs = require("lspconfig.configs")
  local def = rawget(configs, server)
  def.document_config.on_new_config = require("lspconfig.util").add_hook_before(
    def.document_config.on_new_config,
    function(config) config.enabled = false end
  )
end

return M
