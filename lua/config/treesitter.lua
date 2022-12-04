local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "html", "lua", "css", "cpp", "rust" },
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
})
