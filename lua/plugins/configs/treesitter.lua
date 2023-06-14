require("nvim-treesitter.configs").setup({
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
