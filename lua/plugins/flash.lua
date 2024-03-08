return {
	"folke/flash.nvim",
	event = function()
		return "CmdLineEnter"
	end,
	keys = { "f", "F" },
	opts = {
		modes = {
			char = {
				jump_labels = true,
				keys = { "f", "F" },
			},
		},
	},
}
