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
local config = {}

M.did_init = false
function M.init()
  if M.did_init then return end
  M.did_init = true

  local plugin = require("lazy.core.config").spec.plugins.PheloiVim
  if plugin then vim.opt.rtp:append(plugin.dir) end

  -- force setup during initialization
  local opts = require("lazy.core.plugin").values(plugin, "opts")
  config = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  for module, enabled in pairs(config.modules) do
    if enabled then
      local ok, err = pcall(require, "pheloivim." .. module)
      if not ok then error(("Error loading %s...\n\n%s"):format(module, err)) end
    end
  end

  vim.g.mapleader = config.mapleader
end

function M.setup()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- load colorscheme
      vim.cmd.colorscheme(config.colorscheme)
    end,
  })
end

return M
