local M = {}

local defaults = {
  colorscheme = "astrotheme",
  mapleader = " ",
  modules = {
    options = true, -- pheloivim.options
    keymaps = true, -- pheloivim.keymaps
    autocmds = true, -- pheloivim.autocmds
  },
}

M.did_init = false
function M.init()
  if M.did_init then return end
  M.did_init = true

  local plugin = require("lazy.core.config").spec.plugins.PheloiVim
  if plugin then vim.opt.rtp:append(plugin.dir) end

  -- load modules
  for module, enabled in pairs(defaults.modules) do
    if enabled then
      local ok, err = pcall(require, "pheloivim." .. module)
      if not ok then error(("Error loading module `%s`...\n\n%s"):format(module, err)) end
    end
  end

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function() vim.cmd.colorscheme(defaults.colorscheme) end,
  })
end

return M
