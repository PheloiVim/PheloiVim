local M = {}

M.echo = function(str)
	vim.cmd("redraw")
	vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.lazy = function(install_path)
	M.echo("  Installing lazy.nvim & plugins ...")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		install_path,
	})
end

return M
