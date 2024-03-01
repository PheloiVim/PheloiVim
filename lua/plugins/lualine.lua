return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
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
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.deleted,
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
        lualine_x = {
          {
            function() return require("noice").api.status.command.get() end,
            cond = function()
              return package.loaded["noice"]
                and require("noice").api.status.command.has()
            end,
            color = { fg = "pink" },
          },
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function()
              return package.loaded["noice"]
                and require("noice").api.status.mode.has()
            end,
            color = { fg = "pink" },
          },
          {
            function() return "  " .. require("dap").status() end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = { fg = "pink" },
          },
          {
            "diagnostics",
            symbols = icons.diagnostic,
          },
          {
            function()
              local clients = vim.lsp.get_active_clients({ bufnr = 0 })
              local client_names = {}
              for _, client in ipairs(clients) do
                if client.name ~= "null-ls" then
                  table.insert(client_names, client.name)
                end
              end

              local pretty_list_clients = #client_names ~= 0
                and table.concat(client_names, ", ")
              return "[" .. pretty_list_clients .. "]"
            end,
            color = { fg = "pink" },
            padding = 0,
          },
          {
            function()
              local formatters = require("conform").list_formatters(0)
              local available_formatters = {}
              for _, fmt in ipairs(formatters) do
                if fmt.available then
                  table.insert(available_formatters, fmt.name)
                end
              end

              local pretty_list_formatters = #available_formatters ~= 0
                and table.concat(available_formatters, ", ")
              return "[" .. pretty_list_formatters .. "]"
            end,
            color = { fg = "pink" },
            padding = 0,
          },
        },
        lualine_y = {
          {
            function()
              return "Tab size: "
                .. vim.api.nvim_get_option_value(
                  "shiftwidth",
                  { scope = "local" }
                )
            end,
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
