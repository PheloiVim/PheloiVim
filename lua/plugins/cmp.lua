return {
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-calc",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			vim.o.completeopt = "menu,menuone,noselect"
			require("luasnip/loaders/from_vscode").lazy_load()

			local lsp_icons = {
				Namespace = "",
				Text = " ",
				Method = " ",
				Function = "﬘ ",
				Constructor = " ",
				Field = "ﰠ ",
				Variable = " ",
				Class = "ﴯ ",
				Interface = " ",
				Module = " ",
				Property = "ﰠ ",
				Unit = "塞 ",
				Value = " ",
				Enum = " ",
				Keyword = " ",
				Snippet = " ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = " ",
				Struct = "פּ ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
				Table = "",
				Object = " ",
				Tag = "",
				Array = "[]",
				Boolean = " ",
				Number = " ",
				Null = "ﳠ",
				String = " ",
				Calendar = "",
				Watch = " ",
				Package = "",
				Copilot = " ",
			}
			cmp.setup({
				window = {
					completion = {
						border = "single",
					},
					documentation = {
						border = "single",
					},
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(_, vim_item)
						vim_item.kind = string.format("%s %s", lsp_icons[vim_item.kind], vim_item.kind)
						return vim_item
					end,
				},
				sources = {
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "path" },
					{ name = "calc" },
				},
				experimental = {
					ghost_text = true,
				},
				mapping = {
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<TAB>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
}
