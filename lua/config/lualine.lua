local lualine = require('lualine')

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local filename = {
	'filename',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta},
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local diff = {
	'diff',
	symbols = { added = ' ', modified = '柳 ', removed = ' ' },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return " " .. str
	end,
}

local branch = {
	'branch',
	icon = '',
	color = { fg = colors.violet},
}

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	symbols = { error = ' ', warn = ' ', info = ' ' },
	diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

local mid = {
	function()
		return '%='
	end,
}

local lsp = {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Config
lualine.setup({
  	options = {
	component_separators = { left = "", right = "" },
	section_separators = { left = "", right = "" },
    theme = 'tokyonight',
	disabled_filetypes = { "alpha", "NvimTree" },
  },
  sections = {
    lualine_a = {mode},
    lualine_c = {branch, diagnostics, mid, lsp},
    lualine_y = {'encoding'},
    lualine_z = {'location'},
    lualine_b = {filename},
    lualine_x = {diff,filetype},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
})
