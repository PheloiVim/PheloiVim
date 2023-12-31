return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(mode)
            return " " .. mode
          end,
        },
      },
      lualine_b = {
        { "branch", icon = require("pheloivim.icons").git.branch },
      },
      lualine_x = {
        {
          "diff",
          symbols = {
            added = require("pheloivim.icons").git.added,
            modified = require("pheloivim.icons").git.modified,
            removed = require("pheloivim.icons").git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
    },
  },
}
