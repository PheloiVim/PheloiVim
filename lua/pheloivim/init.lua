local M = {}

local defaults = {
  colorscheme = "catppuccin",
  mapleader = " ",
  wrap_spell = { "markdown", "gitcommit" }, -- Filetypes for spell checking and word wrapping
  root_patterns = { ".git" }, -- Root patterns for project detection
  close_with_q = { -- Buffers to close with "q"
    "help",
    "qf",
    "man",
    "lspinfo",
    "checkhealth",
  },
  modules = { -- Modules to enable by default
    options = true, -- pheloivim.options
    keymaps = true, -- pheloivim.keymaps
    autocmds = true, -- pheloivim.autocmds
  },
}

M.config = {}

--- Initializes and sets up PheloiVim configuration.
function M.init()
  local plugin = require("lazy.core.config").spec.plugins.PheloiVim

  -- Append PheloiVim plugin directory to the runtime path
  if plugin then vim.opt.rtp:append(plugin.dir) end

  -- Force setup during initialization
  local opts = require("lazy.core.plugin").values(plugin, "opts")
  M.config = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  -- Load modules
  for module, enabled in pairs(M.config.modules) do
    if enabled then
      local ok, err = pcall(require, "pheloivim." .. module)
      if not ok then error(("Error loading %s...\n\n%s"):format(module, err)) end
    end
  end

  -- Set leader key
  vim.g.mapleader = M.config.mapleader
end

--- Sets up autocmds for PheloiVim configuration.
function M.setup()
  -- Set colorscheme
  vim.cmd.colorscheme(M.config.colorscheme)

  -- Close specified filetypes with <q>
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
    pattern = M.config.close_with_q,
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", vim.cmd.close, { buffer = event.buf, silent = true })
    end,
  })

  -- Auto-enable wrap and spell in specified filetypes
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
    pattern = M.config.wrap_spell,
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
    end,
  })
end

return M
