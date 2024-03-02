return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {
    indent = { char = "▏" },
    scope = { show_start = false, show_end = false, show_exact_scope = false },
    exclude = {
      buftypes = {
        "nofile",
        "terminal",
      },
      filetypes = {
        "help",
        "dashboard",
        "lazy",
        "neo-tree",
        "Trouble",
        "toggleterm",
        "mason",
      },
    },
  },
}
