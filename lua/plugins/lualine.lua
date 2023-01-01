local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local colors = {
    yellow = "#ECBE7B",
    cyan = "#008080",
    red = "#ec5f67",
}

local mode = {
    "mode",
    fmt = function(str)
        return " " .. str
    end,
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

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
        lualine_x = { diagnostics },
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
