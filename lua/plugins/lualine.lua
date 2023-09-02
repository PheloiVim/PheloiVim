return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local mode = {
      "mode",
      fmt = function() return " " end,
    }

    local filename = {
      "filename",
      symbols = {
        modified = "",
      },
    }

    local location = {
      "location",
      separator = "|",
      padding = 2,
      color = { fg = "white" },
    }

    local encoding = {
      "encoding",
      fmt = string.upper,
      separator = "|",
      padding = 2,
      color = { fg = "white" },
    }

    local diagnostics = {
      "diagnostics",
      symbols = { error = " ", warn = " ", hint = " " },
      sections = { "error", "warn", "hint" },
      colored = true,
      update_in_insert = true,
      padding = 2,
    }

    local filetype = {
      "filetype",
      icon_only = true,
      padding = { left = 1 },
    }

    local branch = {
      "branch",
      icon = { "", color = { fg = "orange" } },
      color = { fg = "white" },
      padding = 1,
    }

    local diff = {
      function()
        ---@diagnostic disable-next-line: undefined-field
        if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then return "" end

        ---@diagnostic disable-next-line: undefined-field
        local git_status = vim.b.gitsigns_status_dict

        local added = function()
          if git_status.added == 0 then return "" end
          return " " .. git_status.added
        end
        local changed = function()
          if git_status.changed == 0 then return "" end
          return "  " .. git_status.changed
        end
        local removed = function()
          if git_status.removed == 0 then return "" end
          return "  " .. git_status.removed
        end

        return vim.o.columns > 100 and added() .. changed() .. removed() or ""
      end,
      color = { fg = "white" },
    }

    local spaces = {
      function() return "Tab size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") end,
      padding = 2,
      color = { fg = "white" },
    }

    local progress = {
      "progress",
      fmt = function() return "%P/%L" end,
    }

    return {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "neo-tree",
          "lazy",
          "lspsagaoutline",
          "dapui_console",
          "dap-repl",
          "dapui_watches",
          "dapui_stacks",
          "dapui_breakpoints",
          "dapui_scopes",
          "mason",
          "TelescopePrompt",
          "help",
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode }, -- nvim mode
        lualine_b = { branch, diff }, -- git
        lualine_c = { filetype, filename }, -- file
        lualine_x = { diagnostics }, -- lsp
        lualine_y = { location, encoding, spaces },
        lualine_z = { progress },
      },
    }
  end,
}
