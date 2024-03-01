return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {
    indent = { char = "▏" },
    scope = { show_start = true, show_end = true, show_exact_scope = true },
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
