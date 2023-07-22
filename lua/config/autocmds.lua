vim.api.nvim_create_autocmd("LspAttach", {
  callback = function() vim.opt_local.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}" end,
})
