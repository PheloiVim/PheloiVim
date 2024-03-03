-- Check Neovim version
if vim.fn.has("nvim-0.9") == 0 then
  -- Display error message and prompt user to exit if Neovim version is insufficient
  vim.api.nvim_echo({
    { "PheloiVim requires Neovim >= 0.9\n", "ErrorMsg" },
    { "Press any key to exit", "MoreMsg" },
  }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
  return
end

-- Initializes PheloiVim before plugins are loaded by lazy.nvim
require("pheloivim").init()

return {
  { "folke/lazy.nvim", version = "*" },
  { "PheloiVim/PheloiVim", priority = 10000, lazy = false, config = true, cond = true, version = "*" },
}
