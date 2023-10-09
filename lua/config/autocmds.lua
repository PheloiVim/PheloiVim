-- Auto toggle relative number
vim.api.nvim_create_autocmd("CmdLineEnter", {
  callback = function()
    local exclude = { "neo-tree", "lazy", "alpha", "mason" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd("CmdLineLeave", {
  callback = function()
    local exclude = { "neo-tree", "lazy", "alpha", "mason" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    vim.opt.relativenumber = true
  end,
})

-- Auto toggle nvim-navic
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.opt_local.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
  end,
})
