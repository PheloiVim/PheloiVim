local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
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
  padding = { left = 2 },
}

local branch = {
  "branch",
  icon = { "", color = { fg = "orange" } },
  color = { fg = "white" },
  padding = 2,
}

local diff = {
  function()
    ---@diagnostic disable-next-line: undefined-field
    if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
      return ""
    end

    ---@diagnostic disable-next-line: undefined-field
    local git_status = vim.b.gitsigns_status_dict

    local added = function()
      if git_status.added == 0 then
        return ""
      end
      return " " .. git_status.added
    end
    local changed = function()
      if git_status.changed == 0 then
        return ""
      end
      return "  " .. git_status.changed
    end
    local removed = function()
      if git_status.removed == 0 then
        return ""
      end
      return "  " .. git_status.removed
    end

    return vim.o.columns > 100 and added() .. changed() .. removed() or ""
  end,
  color = { fg = "white" },
}

local spaces = {
  function()
    return "Tab size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  padding = 2,
  color = { fg = "white" },
}

local progress = {
  "progress",
  fmt = function()
    return "%P/%L"
  end,
}

local lsp_info = {
  function()
    local buf_clients = vim.lsp.get_active_clients()
    local buf_client_names = {}

    local list_registered = function(fileType)
      local null_ls = require("null-ls.sources")
      local available_sources = null_ls.get_available(fileType)
      local registered = {}
      for _, source in ipairs(available_sources) do
        for method in pairs(source.methods) do
          registered[method] = registered[method] or {}
          table.insert(registered[method], source.name)
        end
      end
      return registered
    end

    local list_formatters = function(fileType)
      local registered_providers = list_registered(fileType)
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

    vim.list_extend(buf_client_names, list_formatters(vim.bo.filetype))

    local unique_client_names = vim.fn.uniq(buf_client_names)
    return vim.o.columns > 150 and "|   LSP: " .. table.concat(unique_client_names, ", ")
      or #vim.lsp.get_active_clients() .. " LSP Active"
  end,
  color = { fg = "white" },
  padding = { right = 2 },
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
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
    lualine_a = { mode },
    lualine_b = { branch, diff },
    lualine_c = { diagnostics },
    lualine_x = { lsp_info },
    lualine_y = { location, filetype, encoding, spaces },
    lualine_z = { progress },
  },
})
