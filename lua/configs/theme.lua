local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
    return
end

-- Default options
nightfox.setup({
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        styles = { -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
        },
        inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
        modules = { -- List of various plugins and additional options
            -- ...
        },
    },
    palettes = {},
    specs = {},
    groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme carbonfox")

vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1b1f27' })

local hl = vim.api.nvim_set_hl

-- Nvim CMP
hl(0, 'CmpDocBorder', { fg = '#1b1f27' })
hl(0, 'CmPmenu', { bg = '#1e222a' })
hl(0, 'CmpBorder', { fg = '#1b1f27' })
hl(0, 'CmpItemAbbr', { fg = '#cdcecf' })
hl(0, 'CmpItemAbbrMatch', { fg = '#dbc074', bold = true })
hl(0, 'CmpItemKindConstant', { fg = '#fe9373' })
hl(0, 'CmpItemKindFunction', { fg = '#86abdc' })
hl(0, 'CmpItemKindSnippet', { fg = '#c94f6d' })
hl(0, 'CmpItemKindIdentifier', { fg = '#e26886' })
hl(0, 'CmpItemKindField', { fg = '#baa1e2' })
hl(0, 'CmpItemKindVariable', { fg = '#9d79d6' })
hl(0, 'CmpItemKindText', { fg = '#8ebaa4' })
hl(0, 'CmpItemKindStructure', { fg = '#9d79d6' })
hl(0, 'CmpItemKindType', { fg = '#dbc074' })
hl(0, 'CmpItemKindKeyword', { fg = '#ced6e3' })
hl(0, 'CmpItemKindMethod', { fg = '#86abdc' })
-- LSP
hl(0, 'DiagnosticHint', { fg = '#008080' })
hl(0, 'DiagnosticError', { fg = '#ec5f67' })
hl(0, 'LspSignatureActiveParameter', { fg = '#192330', bg = '#8ebaa4' })
-- Float Windows
hl(0, 'NormalFloat', { bg = '#161616' })
hl(0, 'FloatBorder', { fg = '#61afef' })
-- Git
hl(0, 'DiffAdd', {fg = '#61afef'})
hl(0, 'DiffAdded', {fg = '#98c379'})

vim.api.nvim_command("redraw")
