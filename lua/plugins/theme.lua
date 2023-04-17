return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      term_colors = true,
      integrations = {
        lsp_saga = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        hop = true,
        fidget = true,
        treesitter = true,
        mason = true,
        illuminate = true,
        lsp_trouble = true,
        notify = true,
      },
    }
    vim.cmd.colorscheme "catppuccin"
  end,
}
