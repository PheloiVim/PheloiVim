return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
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
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
