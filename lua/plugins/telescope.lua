return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "debugloop/telescope-undo.nvim" },
	keys = {
		{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Find undos" },
	},
	opts = function(_, opts)
		opts.vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		}

		opts.defaults = {
			path_display = { "smart" },
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
				horizontal = { preview_cutoff = 80, width = 0.9 },
			},
		}

		require("telescope").load_extension("undo")
	end,
}
