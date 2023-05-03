return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local encoding = {
      "encoding",
      fmt = string.upper,
      padding = 2,
    }

    local git = function()
      if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
        return ""
      end

      local git_status = vim.b.gitsigns_status_dict

      local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
      local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
      local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
      local branch_name = " " .. git_status.head .. " "

      return branch_name .. added .. changed .. removed
    end

    local diagnostic = {
      "diagnostics",
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      update_in_insert = true,
    }

    local file_type = {
      "filetype",
      icon_only = true,
      separator = "",
      padding = 1,
    }

    local progress = function()
      local current_line = vim.fn.line "."
      local total_lines = vim.fn.line "$"
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return " " .. chars[index] .. " "
    end

    local location = {
      "location",
      separator = "|",
      padding = 2,
    }

    local lsp_info = function()
      local buf_clients = vim.lsp.buf_get_clients()
      local buf_client_names = {}

      local list_registered = function(filetype)
        local null_ls = require "null-ls.sources"
        local available_sources = null_ls.get_available(filetype)
        local registered = {}
        for _, source in ipairs(available_sources) do
          for method in pairs(source.methods) do
            registered[method] = registered[method] or {}
            table.insert(registered[method], source.name)
          end
        end
        return registered
      end

      local list_formatters = function(filetype)
        local registered_providers = list_registered(filetype)
        return registered_providers[require("null-ls").methods.FORMATTING] or {}
      end

      if next(buf_clients) == nil then
        return "No Active LSP"
      end
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local supported_formatters = list_formatters(vim.bo.filetype)
      vim.list_extend(buf_client_names, supported_formatters)

      local unique_client_names = vim.fn.uniq(buf_client_names)
      return "|   LSP: " .. table.concat(unique_client_names, ", ")
    end

    return {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "NvimTree",
          "toggleterm",
          "Trouble",
          "alpha",
          "lspsagaoutline",
          "dapui_console",
          "dap-repl",
          "dapui_watches",
          "dapui_stacks",
          "dapui_breakpoints",
          "dapui_scopes",
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "filename" },
        lualine_c = { git },
        lualine_x = { "searchcount", diagnostic, lsp_info },
        lualine_y = { location, file_type, encoding },
        lualine_z = { progress },
      },
    }
  end,
}
