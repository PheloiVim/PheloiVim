vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Configuration options for Neovim
local options = {
  number = true,
  relativenumber = true,
  laststatus = 3,
  wrap = false,
  cursorline = true,
  conceallevel = 2,
  signcolumn = "yes",
  showtabline = 0,
  foldcolumn = "0",
  clipboard = "unnamedplus",
  autowrite = true,
  undofile = true,
  backup = false,
  writebackup = false,
  mouse = "a",
  linebreak = true,
  copyindent = true,
  termguicolors = true,
  title = true,
  timeoutlen = 100,
  ttimeoutlen = 10,
  splitbelow = true,
  splitright = true,
  ruler = false,
  showmode = false,
  smartcase = true,
  ignorecase = true,
  incsearch = true,
  infercase = true,
  smartindent = true,
  spelllang = { "en" },
  fileencoding = "utf-8",
  fillchars = { eob = " " },
  completeopt = "menu,menuone,noselect",
  list = true,
  pumblend = 10,
  pumheight = 10,
  scrolloff = 4,
  shiftround = true,
  shiftwidth = 2,
  sidescrolloff = 8,
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  foldnestmax = 0,
  history = 100,
  preserveindent = true,
  hlsearch = true,
  swapfile = false,
  numberwidth = 2,
}

-- Set Neovim options
for setting, value in pairs(options) do
  vim.opt[setting] = value
end

-- Additional configuration
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Disable some default providers
local disabled_providers = { "node", "perl", "python3", "ruby" }
for _, provider in ipairs(disabled_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
