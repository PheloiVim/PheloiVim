return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		opts.options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		}

		opts.extensions = {
			"quickfix",
			"lazy",
			"neo-tree",
			"mason",
			"trouble",
			"nvim-dap-ui",
			"toggleterm",
			"man",
			"fugitive",
		}

		opts.sections = vim.tbl_deep_extend("force", opts.sections, {
			lualine_y = {
				{
					function()
						return "Tab size: " .. vim.api.nvim_get_option_value("shiftwidth", { scope = "local" })
					end,
				},
			},
			lualine_z = {
				{
					"progress",
					fmt = function()
						return "%P/%L"
					end,
				},
			},
		})

		vim.list_extend(opts.sections.lualine_x, {
			{
				function()
					local clients = vim.lsp.get_active_clients({ bufnr = 0 })
					local client_names = {}
					for _, client in ipairs(clients) do
						if client.name ~= "null-ls" then
							table.insert(client_names, client.name)
						end
					end

					local pretty_list_clients = #client_names ~= 0 and table.concat(client_names, ", ")
					return "[" .. pretty_list_clients .. "]"
				end,
				padding = 0,
				color = require("lazyvim.util.ui").fg("Special"),
			},
		})
	end,
}
