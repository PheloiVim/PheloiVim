return {
	"phaazon/hop.nvim",
	keys = {
		{ "1", "<cmd>HopWord<cr>" },
		{ "2", "<cmd>HopLine<cr>" },
	},
	config = function()
		local hop = require("hop")
		hop.setup({
			keys = "123456789",
		})
	end,
}
