return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd.colorscheme("duskfox")
  end,
}
