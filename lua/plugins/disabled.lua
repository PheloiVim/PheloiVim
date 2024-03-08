local disabled_plugins = {
	"catppuccin",
	"vim-startuptime",
	"tokyonight.nvim",
	"dashboard-nvim",
	"persistence.nvim",
}

local spec = {}
for _, plugin in ipairs(disabled_plugins) do
	table.insert(spec, {
		plugin,
		enabled = false,
	})
end

return spec
