local opt = vim.opt

opt.laststatus = 0 -- global statusline
opt.grepformat = "%f:%l:%c:%m"
opt.inccommand = "nosplit"
opt.cmdheight = 1
opt.grepprg = "rg --vimgrep"
opt.showmode = false
opt.history = 10
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 4
opt.writebackup = false -- Disable making a backup before overwriting a file
opt.inccommand = "nosplit" -- preview incremental substitute
opt.confirm = true
opt.conceallevel = 3
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.wildmenu = false
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.preserveindent = true
opt.shiftround = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.list = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Remove "How to disable mouse"
vim.cmd [[
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.-1-
]]
