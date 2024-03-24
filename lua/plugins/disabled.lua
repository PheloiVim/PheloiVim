local disabled_plugins = {
	"catppuccin",
	"vim-startuptime",
	"dashboard-nvim",
	"persistence.nvim",
	"mini.indentscope",
}

local spec = {}
for _, plugin in ipairs(disabled_plugins) do
	table.insert(spec, {
		plugin,
		enabled = false,
	})
end

return spec
