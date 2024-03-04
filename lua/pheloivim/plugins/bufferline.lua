return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "<leader>bp",
      function() vim.cmd("BufferLineTogglePin") end,
      desc = "Toggle pin",
    },
    {
      "<leader>bP",
      function() vim.cmd("BufferLineGroupClose ungrouped") end,
      desc = "Delete non-pinned buffers",
    },
    {
      "<leader>bo",
      function() vim.cmd("BufferLineCloseOthers") end,
      desc = "Delete other buffers",
    },
    {
      "<leader>br",
      function() vim.cmd("BufferLineCloseRight") end,
      desc = "Delete buffers to the right",
    },
    {
      "<leader>bl",
      function() vim.cmd("BufferLineCloseLeft") end,
      desc = "Delete buffers to the left",
    },
    {
      "<S-h>",
      vim.cmd.BufferLineCyclePrev,
      desc = "Prev buffer",
    },
    {
      "<S-l>",
      vim.cmd.BufferLineCycleNext,
      desc = "Next buffer",
    },
  },
  opts = function()
    return {
      options = {
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("pheloivim").icons.diagnostic
          local ret = (diag.error and icons.error .. diag.error .. " " or "")
            .. (diag.warning and icons.warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    }
  end,
  init = function()
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        vim.schedule(function() pcall(nvim_bufferline) end)
      end,
    })
  end,
}
