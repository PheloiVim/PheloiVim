vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    ---@type "tokyonight" | "catppuccin" | "nightfox" | "duskfox"
    local theme = "nightfox"
    vim.cmd.colorscheme(theme)
  end,
})

return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    opts = {
      ---@type "storm" | "moon" | "night" | "day"
      style = "moon",
    },
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      ---@type "latte" | "frappe" |  "macchiato" | "mocha"
      flavour = "mocha",
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = { enabled = true, style = "nvchad" },
        treesitter = true,
        treesitter_context = false,
        which_key = true,
      },
    },
  },

  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    opts = {},
  },
}
