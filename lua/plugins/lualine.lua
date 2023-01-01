local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local function lsp()
    if rawget(vim, "lsp") then
        for _, client in ipairs(vim.lsp.get_active_clients()) do
            if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                return (vim.o.columns > 100 and "%#St_LspStatus#" .. "   LSP ~ " .. client.name .. " ") or "   LSP "
            end
        end
    end
end

local mode = {
    "mode",
    fmt = function(str)
        return " " .. str
    end,
}

local function diagnostic()
    if not rawget(vim, "lsp") then
        return ""
    end

    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

    errors = (errors and errors > 0) and ("%#St_lspError#" .. " " .. errors .. " ") or ""
    warnings = (warnings and warnings > 0) and ("%#St_lspWarning#" .. "  " .. warnings .. " ") or ""
    hints = (hints and hints > 0) and ("%#St_lspHints#" .. "ﯧ " .. hints .. " ") or ""
    info = (info and info > 0) and ("%#St_lspInfo#" .. " " .. info .. " ") or ""

    return errors .. warnings .. hints .. info
end

local filename = {
    "filename",
    color = { fg = "FBC252" },
}

local filetype = {
    "filetype",
    icons_enabled = true,
}

local function git()
    if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
        return ""
    end

    local git_status = vim.b.gitsigns_status_dict

    local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
    local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
    local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
    local branch_name = "  " .. git_status.head .. " "

    return "%#St_gitIcons#" .. branch_name .. added .. changed .. removed
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { filename },
        lualine_c = { git },
        lualine_x = { diagnostic, lsp },
        lualine_y = { filetype },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
