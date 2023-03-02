local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = {
	yellow = "#ECBE7B",
	red = "#ec5f67",
	cyan = "#008080",
}

local file_info = function()
	local icon = "  "
	local filename = (vim.fn.expand("%") == "" and "Empty ") or vim.fn.expand("%:t")

	if filename ~= "Empty " then
		local devicons_present, devicons = pcall(require, "nvim-web-devicons")

		if devicons_present then
			local ft_icon = devicons.get_icon(filename)
			icon = (ft_icon ~= nil and " " .. ft_icon) or ""
		end

		filename = " " .. filename .. " |"
	end

	return icon .. filename
end

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local location = {
	"location",
	padding = 1,
}

local git = function()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end

	local git_status = vim.b.gitsigns_status_dict

	local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
	local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
	local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
	local branch_name = " " .. git_status.head .. " "

	return branch_name .. added .. changed .. removed
end

local diagnostic = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	update_in_insert = true,
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return " " .. chars[index] .. " "
end

local lsp_info = function()
	if rawget(vim, "lsp") then
		if next(vim.lsp.get_active_clients()) == nil then
			return "No Active LSP "
		end
		for _, client in ipairs(vim.lsp.get_active_clients()) do
			if client.attached_buffers[vim.api.nvim_get_current_buf()] then
				return "|   LSP ~ " .. client.name .. " "
			end
		end
	end
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "toggleterm", "Trouble", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = {},
		lualine_c = { file_info, git, "%=" },
		lualine_x = { diagnostic, lsp_info },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
