return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "c_sharp",
      "css",
      "scss",
    })
  end,
}
