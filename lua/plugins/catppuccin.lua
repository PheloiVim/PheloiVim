return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      cmp = true,
      gitsigns = true,
      telescope = true,
      treesitter = true,
      illuminate = true,
      mini = true,
      lsp_saga = true,
      markdown = true,
      mason = true,
      neotree = true,
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
