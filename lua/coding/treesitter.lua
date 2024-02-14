return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "windwp/nvim-ts-autotag", opts = { enable_close_on_slash = false } },
    },
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        disable = function(_, bufnr) return vim.b[bufnr].large_buf end,
      },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
        },
        move = {
          enable = true,
        },
      },
      ensure_installed = {
        "diff",
        "query",
        "vim",
        "regex",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "astro",
        "bash",
        "cpp",
        "c",
        "proto",
        "dockerfile",
        "http",
        "yaml",
        "c_sharp",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "json",
        "json5",
        "jsonc",
        "vue",
        "sql",
        "graphql",
        "rust",
        "toml",
        "typescript",
        "tsx",
        "javascript",
        "jsdoc",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.install").compilers = { "clang" }
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { throttle = true, mode = "cursor", max_lines = 3 },
  },
}
