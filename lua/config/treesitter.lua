local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "lua", "cpp", "rust", "python" },
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
})
