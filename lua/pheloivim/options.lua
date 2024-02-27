vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.laststatus = 3 -- Global status line
vim.opt.breakindent = true -- Wrap indent to match line start
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.autowrite = true -- Enable auto write
vim.opt.undofile = true -- Enable persistent undo
vim.opt.backup = false -- Don't store backup while overwriting the file
vim.opt.writebackup = false -- Don't store backup while overwriting the file
vim.opt.mouse = "a" -- Enable mouse for all available modes
vim.opt.cursorline = true -- Highlight current line
vim.opt.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.opt.copyindent = true -- copy the previous indentation on auto indenting
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.opt.title = true -- set terminal title to the filename and path
vim.opt.updatetime = 300 -- length of time to wait before triggering the plugin
vim.opt.virtualedit = "block" -- allow going past end of line in visual block mode
vim.opt.wrap = false -- disable wrapping of lines longer than the width of window
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.timeoutlen = 300 -- shorten key timeout length a little bit for which-key
vim.opt.splitbelow = true -- Horizontal splits will be below
vim.opt.splitright = true -- Vertical splits will be to the right
vim.opt.ruler = false -- Don't show cursor position in command line
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
vim.opt.incsearch = true -- Show search results while typing
vim.opt.infercase = true -- Infer letter cases for a richer built-in keyword completion
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.showtabline = 2 -- always display tab line
vim.opt.fileencoding = "utf-8" -- file content encoding for the buffer
vim.opt.fillchars = "eob: " -- Don't show `~` outside of buffer
vim.opt.completeopt = "menu,menuone,noselect" -- Options for insert mode completion
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.pumblend = 10 -- Make builtin completion menus slightly transparent
vim.opt.pumheight = 10 -- Make popup menu smaller
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.foldcolumn = "1" -- show fold column
vim.opt.foldenable = true -- enable fold for nvim-ufo
vim.opt.foldlevel = 99 -- set high fold level for nvim-ufo
vim.opt.foldlevelstart = 99 -- start with all code unfolded
vim.opt.foldmethod = "expr"
vim.opt.history = 100 -- number of commands to remember in a history table
vim.opt.preserveindent = true -- preserve indent structure as much as possible
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- disable search count wrap and startup messages
vim.opt.smoothscroll = true -- enable smooth scroll in neovim 0.10 (:h smoothscroll)
vim.opt.hlsearch = true -- highlight search
vim.opt.swapfile = false -- disable swap
vim.opt.numberwidth = 2

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
