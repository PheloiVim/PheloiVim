local hop = require("hop")
hop.setup({
	keys = "123456789",
})

local directions = require("hop.hint").HintDirection
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
