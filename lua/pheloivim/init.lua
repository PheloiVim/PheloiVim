---@class PheloiVimConfig: PheloiVimOptions
local M = {}

--- Default configuration options
---@class PheloiVimOptions
local defaults = {
  colorscheme = "tokyonight",
  modules = {
    autocmds = true,
    keymaps = true,
  },
  icons = {
    git = {
      added = " ",
      modified = " ",
      deleted = " ",
      renamed = "➜",
      untracked = "★",
      ignored = "◌",
      unstaged = "✗",
      staged = "✓",
      conflict = "",
      branch = "",
    },
    diagnostic = {
      error = " ",
      hint = "󰌵 ",
      info = "󰋼 ",
      warn = " ",
    },
    dap = {
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = { " ", "DapBreakpoint" },
      BreakpointCondition = { " ", "DapBreakpointCondition" },
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = { ".>", "DapLogPoint" },
    },
  },
}

--- Current configuration options
---@type PheloiVimOptions
local options

--- Setup PheloiVim configuration
---@param opts? PheloiVimOptions: Options for PheloiVim (optional)
function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  local lazy_autocmds = vim.fn.argc(-1) == 0
  if not lazy_autocmds then M.load("autocmds") end

  local group = vim.api.nvim_create_augroup("PheloiVim", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = function()
      if lazy_autocmds then M.load("autocmds") end
      M.load("keymaps")
    end,
  })

  if type(M.colorscheme) == "function" then
    M.colorscheme()
  else
    vim.cmd.colorscheme(M.colorscheme)
  end
end

--- Load configurations for a specific module
---@param name "autocmds" | "options" | "keymaps"
function M.load(name)
  local function _load(mod)
    if require("lazy.core.cache").find(mod)[1] then require(mod) end
  end

  if M.modules[name] or name == "options" then _load("pheloivim.core." .. name) end

  _load("config." .. name)

  if vim.bo.filetype == "lazy" then vim.cmd("do VimResized") end

  local pattern = "PheloiVim" .. name:sub(1, 1):upper() .. name:sub(2)
  vim.api.nvim_exec_autocmds("User", { pattern = pattern, modeline = false })
end

M.did_init = false

--- Initialize PheloiVim
function M.init()
  if M.did_init then return end
  M.did_init = true
  local plugin = require("lazy.core.config").spec.plugins.PheloiVim
  if plugin then vim.opt.rtp:append(plugin.dir) end
  M.load("options")
end

--- Metatable to provide default values when accessing M
---@type table<string, function>
setmetatable(M, {
  __index = function(_, key)
    if options == nil then return vim.deepcopy(defaults)[key] end
    return options[key]
  end,
})

return M
