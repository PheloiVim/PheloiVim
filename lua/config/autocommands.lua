local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local general = augroup("General Settings", { clear = true })

-- Highlight when yanking
autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank({ higroup = "YankHighlight", timeout = 200 })
	end,
	group = general,
})

-- Start terminal mode when terminal buffer open.
autocmd("TermOpen", {
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.cmd("startinsert!")
	end,
	group = general,
})
