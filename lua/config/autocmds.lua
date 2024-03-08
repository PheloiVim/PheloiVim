-- Disable relative number in command mode
vim.api.nvim_create_autocmd("CmdLineEnter", {
	callback = function()
		local excluded_filetypes = { "lazy" }
		local ft = vim.bo.filetype
		if vim.tbl_contains(excluded_filetypes, ft) then
			return
		end

		vim.opt_local.relativenumber = false
	end,
})

-- Disable relative number in some file types
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	callback = function()
		vim.opt_local.relativenumber = false
	end,
})

-- Reset relativenumber after leaving command mode
vim.api.nvim_create_autocmd("CmdLineLeave", {
	callback = function()
		local excluded_filetypes = { "lazy" }
		local ft = vim.bo.filetype
		if vim.tbl_contains(excluded_filetypes, ft) then
			return
		end

		vim.opt_local.relativenumber = true
	end,
})
