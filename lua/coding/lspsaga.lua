return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    rename = {
      keys = {
        quit = "<ESC>",
      },
    },
    ui = {
      code_action = "",
    },
    symbol_in_winbar = {
      show_file = false,
    },
    code_action = {
      show_server_name = true,
    },
    lightbulb = {
      enable_in_insert = true,
      virtual_text = true,
      sign = false,
    },
  },
}
