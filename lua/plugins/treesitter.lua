return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  opts = {
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
    sync_install = false,
    auto_install = true,
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
}
