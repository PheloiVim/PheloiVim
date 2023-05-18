return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
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
    textobjects = {
      select = {
        enable = true,
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
      move = {
        enable = false,
      },
      lsp_interop = {
        enable = true,
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
