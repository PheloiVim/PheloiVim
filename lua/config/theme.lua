vim.cmd([[colorscheme tokyonight]])

require("tokyonight").setup({
	style = "night",
	terminal_colors = true,
})

vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
