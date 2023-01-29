local status_ok, _ = pcall(vim.cmd, "colorscheme " .. "tokyonight-storm")
if not status_ok then
	return
end
