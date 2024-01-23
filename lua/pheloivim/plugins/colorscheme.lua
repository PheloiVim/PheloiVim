vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    ---@type "tokyonight" | "catppuccin" | "nightfox" | "duskfox"
    local theme = "tokyonight"
    vim.cmd.colorscheme(theme)
  end,
})

return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    opts = {
      ---@type "storm" | "moon" | "night" | "day"
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
    lazy = true,
    opts = {},
  },
}
