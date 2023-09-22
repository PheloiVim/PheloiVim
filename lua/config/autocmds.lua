-- Auto toggle relative number
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function() vim.cmd("set norelativenumber") end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function() vim.cmd("set relativenumber") end,
})
