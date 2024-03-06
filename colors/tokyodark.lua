local palette = {
  black = "#06080A",
  grey = "#33363c",
  white = "#ced4df",
  bg = "#11121D",
  fg = "#A0A8CD",
  grey_fg = "#4A5057",
}

local highlight = {
  Normal = { fg = palette.fg, bg = palette.bg },
  MatchWord = { bg = palette.grey, fg = palette.white },
  Pmenu = { bg = palette.black },
  Comment = { fg = palette.grey_fg },
  FloatBorder = { fg = palette.grey, bg = palette.black },
}

vim.cmd("hi clear")
vim.o.background = "dark"
for group, group_opts in pairs(highlight) do
  vim.api.nvim_set_hl(0, group, group_opts)
end
