return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local colors = {
      yellow = "#ECBE7B",
      red = "#ec5f67",
      cyan = "#008080",
    }

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
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
      update_in_insert = true,
    }

    local progress = function()
      local current_line = vim.fn.line "."
      local total_lines = vim.fn.line "$"
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return " " .. chars[index] .. " "
    end

    function Formatter(filetype)
      local s = require "null-ls.sources"
      local available_sources = s.get_available(filetype)
      local registered = {}
      for _, source in ipairs(available_sources) do
        for method in pairs(source.methods) do
          registered[method] = registered[method] or {}
          table.insert(registered[method], source.name)
        end
      end
      return registered
    end

    function List_registered(filetype)
      local registered_providers = Formatter(filetype)
      return registered_providers[require("null-ls").methods.FORMATTING] or {}
    end

    local lsp_info = function()
      local buf_clients = vim.lsp.buf_get_clients()
      local buf_client_names = {}

      if next(buf_clients) == nil then
        return "No Active LSP"
      end
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local file_type = vim.bo.filetype
      local supported_formatters = List_registered(file_type)
      vim.list_extend(buf_client_names, supported_formatters)

      local unique_client_names = vim.fn.uniq(buf_client_names)
      return "|   LSP: " .. table.concat(unique_client_names, ", ")
    end

    return {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "NvimTree", "toggleterm", "Trouble", "alpha", "lspsagaoutline" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "location" },
        lualine_c = { git },
        lualine_x = { "searchcount", diagnostic, lsp_info },
        lualine_y = { "filetype", "filesize", encoding },
        lualine_z = { progress },
      },
    }
  end,
}
