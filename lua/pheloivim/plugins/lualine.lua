return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    return {
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
          -- {
          --   require("noice").api.status.mode.get,
          --   cond = require("noice").api.status.mode.has,
          -- },
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          },
          {
            "diagnostics",
            symbols = {
              error = "● ",
              warn = "● ",
              info = "● ",
              hint = "● ",
            },
          },
        },
        lualine_y = {
          {
            function()
              return "Tab size: " .. vim.api.nvim_get_option_value("shiftwidth", {
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
    }
  end,
}
