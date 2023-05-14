return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    term_colors = true,
    integrations = {
      lsp_saga = true,
      cmp = true,
      navic = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      hop = true,
      fidget = true,
      treesitter = true,
      mason = true,
      illuminate = true,
      notify = true,
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
      dap = {
        enabled = true,
        enable_ui = true,
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
