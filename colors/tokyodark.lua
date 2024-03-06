local palette = {
  black = "#06080A",
  bg = "#0B0E14",
  fg = "#A0A8CD",
}

local highlight = {
  Normal = { fg = palette.fg, bg = palette.bg },
}

vim.cmd("hi clear")
vim.o.background = "dark"
for group, group_opts in pairs(highlight) do
  vim.api.nvim_set_hl(0, group, group_opts)
end
