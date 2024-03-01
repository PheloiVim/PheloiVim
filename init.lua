-- Display messages in the command line with different highlight groups
vim.api.nvim_echo({
  {
    "This repository is not meant to be used as a direct Neovim configuration\n",
    "ErrorMsg",
  }, -- Display an error message
  {
    "Please check the PheloiVim documentation for installation details\n",
    "WarningMsg",
  }, -- Display a warning message
  { "Press any key to exit...", "MoreMsg" }, -- Display a message prompting to press any key
}, true, {}) -- The `true` argument clears the command line before displaying messages, `{}` is used for options which are empty in this case

-- Wait for a single character input from the user
vim.fn.getchar()

-- Quit Neovim
vim.cmd.quit()
