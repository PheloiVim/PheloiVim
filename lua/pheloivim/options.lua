local options = {
  number = true, -- Print line number
  relativenumber = true, -- Relative line numbers
  laststatus = 3, -- Global status line
  breakindent = true, -- Wrap indent to match line start
  clipboard = "unnamedplus", -- Sync with system clipboard
  autowrite = true, -- Enable auto write
  undofile = true, -- Enable persistent undo
  backup = false, -- Don't store backup while overwriting the file
  writebackup = false, -- Don't store backup while overwriting the file
  mouse = "a", -- Enable mouse for all available modes
  cursorline = true, -- Highlight current line
  linebreak = true, -- Wrap long lines at 'breakat' (if 'wrap' is set)
  copyindent = true, -- copy the previous indentation on auto indenting
  termguicolors = true, -- enable 24-bit RGB color in the TUI
  title = true, -- set terminal title to the filename and path
  updatetime = 300, -- length of time to wait before triggering the plugin
  virtualedit = "block", -- allow going past end of line in visual block mode
  wrap = false, -- disable wrapping of lines longer than the width of window
  conceallevel = 2, -- Hide * markup for bold and italic, but not markers with substitutions
  confirm = true, -- Confirm to save changes before exiting modified buffer
  expandtab = true, -- Use spaces instead of tabs
  timeoutlen = 100, -- shorten key timeout length a little bit for which-key
  ttimeoutlen = 10,
  splitbelow = true, -- Horizontal splits will be below
  splitright = true, -- Vertical splits will be to the right
  ruler = false, -- Don't show cursor position in command line
  showmode = false, -- Don't show mode in command line
  signcolumn = "yes", -- Always show the sign column, otherwise it would shift the text each time
  smartcase = true, -- Don't ignore case with capitals
  ignorecase = true, -- Ignore case when searching (use `\C` to force not doing that)
  incsearch = true, -- Show search results while typing
  infercase = true, -- Infer letter cases for a richer built-in keyword completion
  smartindent = true, -- Insert indents automatically
  spelllang = { "en" }, -- Spell check language
  showtabline = 2, -- always display tab line
  fileencoding = "utf-8", -- file content encoding for the buffer
  fillchars = { eob = " " }, -- Don't show `~` outside of buffer
  completeopt = "menu,menuone,noselect", -- Options for insert mode completion
  list = true, -- Show some invisible characters
  pumblend = 10, -- Make builtin completion menus slightly transparent
  pumheight = 10, -- Make popup menu smaller
  scrolloff = 4, -- Lines of context
  shiftround = true, -- Round indent
  shiftwidth = 2, -- Size of an indent
  sidescrolloff = 8, -- Columns of context
  foldcolumn = "1", -- show fold column
  foldenable = true, -- enable fold for nvim-ufo
  foldlevel = 99, -- set high fold level for nvim-ufo
  foldlevelstart = 99, -- start with all code unfolded
  foldmethod = "expr",
  history = 100, -- number of commands to remember in a history table
  preserveindent = true, -- preserve indent structure as much as possible
  smoothscroll = true, -- enable smooth scroll in neovim 0.10 (:h smoothscroll)
  hlsearch = true, -- highlight search
  swapfile = false, -- disable swap
  numberwidth = 2,
}

for setting, value in pairs(options) do
  vim.opt[setting] = value
end

vim.opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- disable search count wrap and startup messages

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
