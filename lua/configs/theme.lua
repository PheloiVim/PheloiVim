local colorscheme = "carbonfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

local hl = vim.api.nvim_set_hl
-- Nvim CMP
hl(0, "CmpDocBorder", { fg = "#D4D6E4" })
hl(0, "CmPmenu", { bg = "#D4D6E4" })
hl(0, "CmpBorder", { fg = "#D4D6E4" })
hl(0, "CmpItemAbbr", { fg = "#cdcecf" })
hl(0, "CmpItemAbbrMatch", { fg = "#dbc074", bold = true })
hl(0, "CmpItemKindConstant", { fg = "#fe9373" })
hl(0, "CmpItemKindFunction", { fg = "#86abdc" })
hl(0, "CmpItemKindSnippet", { fg = "#c94f6d" })
hl(0, "CmpItemKindIdentifier", { fg = "#e26886" })
hl(0, "CmpItemKindField", { fg = "#baa1e2" })
hl(0, "CmpItemKindVariable", { fg = "#9d79d6" })
hl(0, "CmpItemKindText", { fg = "#8ebaa4" })
hl(0, "CmpItemKindStructure", { fg = "#9d79d6" })
hl(0, "CmpItemKindType", { fg = "#dbc074" })
hl(0, "CmpItemKindKeyword", { fg = "#ced6e3" })
hl(0, "CmpItemKindMethod", { fg = "#86abdc" })
hl(0, "CmpItemKindConstructor", { fg = "#7aa2f7" })
hl(0, "CmpItemKindFolder", { fg = "#c0caf5" })
hl(0, "CmpItemKindModule", { fg = "#ffd089" })
hl(0, "CmpItemKindProperty", { fg = "#f7768e" })

-- Float Windows
hl(0, "NormalFloat", { bg = "#161616" })
hl(0, "FloatBorder", { fg = "#D4D6E4" })

-- Git
hl(0, "DiffAdd", { fg = "#61afef" })
hl(0, "DiffAdded", { fg = "#98c379" })
hl(0, "DiffChange", { fg = "#6f737b" })
hl(0, "DiffChangeDelete", { fg = "#e06c75" })
hl(0, "DiffModified", { fg = "#fca2aa" })
hl(0, "DiffDelete", { fg = "#e06c75" })
hl(0, "DiffRemoved", { fg = "#e06c75" })

-- Lualine
hl(0, "St_lspError", { fg = "#e06c75", bg = "#0C0C0C" })
hl(0, "St_lspWarning", { fg = "#FFFF00", bg = "#0C0C0C" })
hl(0, "St_LspHints", { fg = "#00FFFF", bg = "#0C0C0C" })
hl(0, "St_LspInfo", { fg = "#2EA043", bg = "#0C0C0C" })
hl(0, "St_LspStatus", { fg = "#C4C8DA", bg = "#0C0C0C" })
