return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
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
        "neogitstatus",
        "neo-tree",
        "Trouble",
        "toggleterm",
        "mason",
      },
    },
  },
}
