return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      cmp = true,
      indent_blankline = {
        enabled = true,
        scope_color = "lavender",
        colored_indent_levels = true,
      },
      mini = {
        enabled = true,
      },
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      lsp_saga = true,
      markdown = true,
      mason = true,
      neotree = true,
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
        inlay_hints = {
          background = true,
        },
      },
      which_key = true,
      treesitter = true,
      ufo = true,
      lsp_trouble = false,
      illuminate = {
        enabled = true,
        lsp = false,
      },
      semantic_tokens = true,
      dashboard = true,
      fidget = true,
      flash = true,
      harpoon = true,
      gitsigns = true,
      noice = true,
      dap = true,
      dap_ui = true,
      notify = true,
    },
  },
}
