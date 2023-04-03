return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local lualine = require "lualine"

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

    local lsp_info = {
      function()
        local buf_clients = vim.lsp.buf_get_clients()
        if next(buf_clients) == nil then
          return "No Active LSP"
        end
        local buf_client_names = {}
        for _, client in pairs(buf_clients) do
          if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
          end
        end
        local unique_client_names = vim.fn.uniq(buf_client_names)
        local LSP = "|   LSP ~ " .. table.concat(unique_client_names, ", ") .. " "
        return LSP
      end,
      color = { fg = "#30F78A" },
    }

    lualine.setup {
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "NvimTree", "toggleterm", "Trouble" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {},
        lualine_c = { git },
        lualine_x = { diagnostic, lsp_info },
        lualine_y = { encoding },
        lualine_z = { progress },
      },
    }
  end,
}
