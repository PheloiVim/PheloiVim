-- Auto toggle relative number
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdLineEnter" }, {
  callback = function()
    local exclude = { "neo-tree" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then return end
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdLineLeave" }, {
  callback = function()
    local exclude = { "neo-tree" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then return end
    vim.opt.relativenumber = true
  end,
})
