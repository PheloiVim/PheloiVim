return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup {
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
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
