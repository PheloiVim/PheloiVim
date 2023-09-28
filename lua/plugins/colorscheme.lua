return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    integrations = {
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
