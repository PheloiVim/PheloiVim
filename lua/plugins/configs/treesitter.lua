require("nvim-treesitter.configs").setup({
  sync_install = true,
  auto_install = true,
  ensure_installed = {
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "html",
    "css",
    "javascript",
    "java",
    "rust",
    "cpp",
    "c",
    "yaml",
    "typescript",
    "json",
    "luap",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
