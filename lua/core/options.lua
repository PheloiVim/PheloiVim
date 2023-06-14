local options = {
  backup = false,
  writebackup = false,
  laststatus = 0,
  showmode = false,
  autowrite = true,
  clipboard = "unnamedplus", -- Use system clipboard
  cursorline = true,
  conceallevel = 3, -- Hide * markup for bold and italic
  fileencoding = "utf-8",
  hlsearch = true,
  confirm = true, -- Confirm to save changes before exiting modified buffer
  expandtab = true, -- Use spaces instead of tabs
  ignorecase = true, -- Ignore case
  inccommand = "nosplit", -- preview incremental substitute
  mouse = "a", -- Enable mouse mode
  number = true, -- Print line number
  pumblend = 10, -- Popup blend
  pumheight = 10, -- Maximum number of entries in a popup
  scrolloff = 4, -- Lines of context
  ruler = false,
  shiftround = true, -- Round indent
  shiftwidth = 2, -- Size of an indent
  sidescrolloff = 8, -- Columns of context
  signcolumn = "yes", -- Always show the signcolumn, otherwise it would shift the text each time
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  tabstop = 2,
  numberwidth = 2,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  undolevels = 10000,
  updatetime = 100,
  winminwidth = 5,
  wrap = true,
}

vim.opt.spelllang = "en"
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
