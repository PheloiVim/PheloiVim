local M = {}

function M.lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  -- TODO: change vim.loop to vim.uv when upgrade to neovim 0.10
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  if not pcall(require, "lazy") then
    vim.api.nvim_echo({
      string.format("Unable to load lazy from %s\n", lazypath),
      "ErrorMsg",
    })
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

return M
