return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>nd",
      function() require("notify").dismiss({ silent = true, pending = true }) end,
      desc = "Dismiss all",
    },
  },
  opts = {
    timeout = 3000,
    max_height = function() return math.floor(vim.o.lines * 0.75) end,
    max_width = function() return math.floor(vim.o.columns * 0.75) end,
    on_open = function(win) vim.api.nvim_win_set_config(win, { zindex = 100 }) end,
  },
  init = function()
    if not require("utils.manager").has("noice.nvim") then
      vim.notify = require("notify")
    end
  end,
}
