return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    show_current_context_start = false,
    char = "│",
    colored_indent_levels = true,
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
      "help",
      "NvimTree",
      "lazy",
      "alpha",
    },
  },
}
