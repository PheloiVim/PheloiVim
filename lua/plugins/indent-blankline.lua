return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "▏" },
    scope = { enabled = false },
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
