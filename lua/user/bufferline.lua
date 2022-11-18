local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end
bufferline.setup {}
	  options = {
		numbers = "none",
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		indicator_icon = nil,
		indicator = { style = "icon", icon = "▎"},
		buffer_close_icon = "",
		close_icon = "",
		tab_size = 21,
		modified_icon = "●",
		diagnostics = false,
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "bar",
}
highlights = {
	fill = {
		fg = { attribute = "fg", highlight = "#ff0000" },
		bg = { attribute = "bg", highlight = "TabLine" },
	},
	background = {
		fg = { attribute = "fg", highlight = "TabLine" },
		bg = { attribute = "bg", highlight = "TabLine" },
	}
}
