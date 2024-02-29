return {
  "folke/noice.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
      inc_rename = false,
    },
  },
  keys = {
    { "<leader>nl", function() require("noice").cmd("last") end, desc = "Last Message" },
    { "<leader>nh", function() require("noice").cmd("history") end, desc = "History" },
  },
}
