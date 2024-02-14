-- Theme
return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    style = "night",
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
