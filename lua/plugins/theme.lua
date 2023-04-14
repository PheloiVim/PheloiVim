return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        fidget = true,
        treesitter = true,
        mason = true,
        illuminate = true,
      },
    }
    vim.cmd "colorscheme catppuccin"
  end,
}
