return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    extensions = { "quickfix", "lazy", "nvim-tree", "mason", "trouble", "nvim-dap-ui", "toggleterm", "man" },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(mode) return " " .. mode end,
        },
      },
      lualine_b = {
        { "branch", icon = require("pheloivim.icons").git.branch },
      },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = require("pheloivim.icons").diagnostics.Error,
            warn = require("pheloivim.icons").diagnostics.Warn,
            info = require("pheloivim.icons").diagnostics.Info,
            hint = require("pheloivim.icons").diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
        {
          "filename",
          path = 1,
          symbols = {
            modified = "",
            readonly = "󰌾",
            unnamed = "[No Name]",
            newfile = "[New]",
          },
        },
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
            ---@diagnostic disable-next-line: undefined-field
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
      lualine_y = {
        {
          function()
            return "Tab size: "
              .. vim.api.nvim_get_option_value("shiftwidth", {
                scope = "local",
              })
          end,
        },
      },
      lualine_z = {
        {
          "progress",
          fmt = function() return "%P/%L" end,
        },
      },
    },
  },
}
