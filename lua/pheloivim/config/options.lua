local config = {
  opt = {
    backup = false,
    fillchars = { eob = " ", stl = " " },
    breakindent = true,
    wildmode = "longest:full,full",
    wildmenu = true,
    undolevels = 10000,
    autowrite = true,
    formatoptions = "jcroqlnt",
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --vimgrep",
    clipboard = "unnamedplus",
    termguicolors = true,
    hlsearch = true,
    writebackup = false,
    swapfile = false,
    conceallevel = 0,
    fileencoding = "utf-8",
    wrap = false,
    virtualedit = "block",
    updatetime = 100,
    undofile = true,
    redrawtime = 1500,
    title = true,
    timeoutlen = 200,
    ttimeoutlen = 10,
    tabstop = 2,
    splitbelow = true,
    list = false,
    splitright = true,
    splitkeep = "screen",
    spelllang = { "en" },
    smartcase = true,
    smartindent = true,
    sidescrolloff = 8,
    scrolloff = 4,
    signcolumn = "yes",
    showmode = false,
    confirm = true,
    cursorline = true,
    expandtab = true,
    shiftwidth = 2,
    shiftround = true,
    relativenumber = true,
    pumheight = 10,
    pumblend = 10,
    inccommand = "nosplit",
    preserveindent = true,
    number = true,
    linebreak = true,
    mouse = "a",
    ignorecase = true,
    showcmd = false,
    ruler = false,
    laststatus = 3,
    infercase = true,
    hidden = true,
    copyindent = true,
    numberwidth = 2,
    completeopt = { "menu", "menuone", "noselect" },
  },
  g = {
    mapleader = " ",
    maplocalleader = "\\",
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    markdown_recommended_style = 0,
  },
}

for scope, table in pairs(config) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end

vim.opt.viewoptions:remove("curdir")
vim.opt.shortmess:append({ s = true, I = true })
vim.opt.backspace:append({ "nostop" })

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
