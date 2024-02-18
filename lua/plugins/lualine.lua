return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local icons = require("icons")
    vim.o.laststatus = vim.g.lualine_laststatus
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    return {
      options = {
        icons_enabled = true,
        always_divide_middle = true,
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard" } },
      },
      extensions = {
        "quickfix",
        "lazy",
        "neo-tree",
        "mason",
        "trouble",
        "nvim-dap-ui",
        "toggleterm",
        "man",
        "oil",
        "fugitive",
      },
      sections = {
        lualine_a = {
          { "mode", fmt = function(mode) return " " .. mode end },
        },
        lualine_b = {},
        lualine_c = {
          { "branch", icon = icons.git.branch, color = { fg = "pink" } },
          {
            "diff",
            symbols = icons.git,
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
        lualine_x = {
          {
            ---@diagnostic disable-next-line: undefined-field
            function() return require("noice").api.status.command.get() end,
            ---@diagnostic disable-next-line: undefined-field
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = { fg = "pink" },
          },
          {
            ---@diagnostic disable-next-line: undefined-field
            function() return require("noice").api.status.mode.get() end,
            ---@diagnostic disable-next-line: undefined-field
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = { fg = "pink" },
          },
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = { fg = "pink" },
          },
          {
            "diagnostics",
            symbols = icons.diagnostics,
          },
          {
            function()
              local linters = require("lint").get_running()
              if #linters == 0 then return "󰦕 " end
              return "󱉶 " .. table.concat(linters, ", ")
            end,
            color = { fg = "pink" },
          },
          {
            function()
              local clients = vim.lsp.get_active_clients({ bufnr = 0 })
              local formatters = require("conform").list_formatters(0)

              local available_formatters = {}
              for _, fmt in ipairs(formatters) do
                if fmt.available then table.insert(available_formatters, fmt.name) end
              end

              local client_names = {}
              for _, client in ipairs(clients) do
                if client.name ~= "null-ls" then table.insert(client_names, client.name) end
              end

              local pretty_list_clients = #client_names ~= 0 and table.concat(client_names, ", ") or "No Active Client"
              local pretty_list_formatters = #available_formatters ~= 0 and table.concat(available_formatters, ", ") or "No Active Formatter"

              return "[" .. pretty_list_clients .. "]" .. "[" .. pretty_list_formatters .. "]"
            end,
            color = { fg = "pink" },
          },
        },
        lualine_y = {
          {
            function() return "Tab size: " .. vim.api.nvim_get_option_value("shiftwidth", { scope = "local" }) end,
          },
        },
        lualine_z = {
          { "progress", fmt = function() return "%P/%L" end },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
