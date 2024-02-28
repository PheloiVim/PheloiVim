local M = {}

local defaults = {
  colorscheme = "catppuccin",
  mapleader = " ",
  wrap_spell = { "markdown", "gitcommit" },
  root_patterns = { ".git" },
  close_with_q = {
    "help",
    "qf",
    "man",
    "lspinfo",
    "checkhealth",
  },
  modules = {
    options = true, -- pheloivim.options
    keymaps = true, -- pheloivim.keymaps
    autocmds = true, -- pheloivim.autocmds
  },
}

M.config = {}

M.did_init = false
function M.init()
  if M.did_init then return end
  M.did_init = true

  local plugin = require("lazy.core.config").spec.plugins.PheloiVim
  if plugin then vim.opt.rtp:append(plugin.dir) end

  -- force setup during initialization
  local opts = require("lazy.core.plugin").values(plugin, "opts")
  M.config = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  -- load modules
  for module, enabled in pairs(M.config.modules) do
    if enabled then
      local ok, err = pcall(require, "pheloivim." .. module)
      if not ok then error(("Error loading %s...\n\n%s"):format(module, err)) end
    end
  end

  -- leader key
  vim.g.mapleader = M.config.mapleader
end

function M.setup()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- load theme
      vim.cmd.colorscheme(M.config.colorscheme)
    end,
  })

  -- close some filetypes with <q>
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
    pattern = M.config.close_with_q,
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", vim.cmd.close, { buffer = event.buf, silent = true })
    end,
  })

  -- auto enable wrap and spell in some filetypes
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
