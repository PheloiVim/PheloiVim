return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				draw = {
					delay = 50,
				},
			})
		end,
	},
	config = function()
		local indent_blankline = require("indent_blankline")
		vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
		vim.g.indent_blankline_filetype_exclude = {
			"help",
			"NvimTree",
			"Trouble",
		}
		vim.g.indentLine_enabled = 1
		vim.g.indent_blankline_char = "▏"
		vim.g.indent_blankline_show_trailing_blankline_indent = false
		vim.g.indent_blankline_show_first_indent_level = true
		vim.g.indent_blankline_use_treesitter = true
		vim.g.indent_blankline_show_current_context = true
		vim.g.indent_blankline_context_patterns = {
			"class",
			"return",
			"function",
			"method",
			"^if",
			"^while",
			"jsx_element",
			"^for",
			"^object",
			"^table",
			"block",
			"arguments",
			"if_statement",
			"else_clause",
			"jsx_element",
			"jsx_self_closing_element",
			"try_statement",
			"catch_clause",
			"import_statement",
			"operation_type",
		}
		vim.wo.colorcolumn = "99999"

		indent_blankline.setup({
			show_current_context = true,
		})
	end,
}
