-- Theme
return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    style = "moon",
    on_highlights = function(hl, c)
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = "#2d3149",
      }
      hl.TelescopePromptBorder = {
        bg = "#2d3149",
        fg = "#2d3149",
      }
      hl.TelescopePromptTitle = {
        fg = "#2d3149",
        bg = "#2d3149",
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
