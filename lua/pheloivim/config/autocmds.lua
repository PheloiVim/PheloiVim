--- ### Auto commands
---@module "pheloivim.config.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  desc = "Check if the file changed on editor focus",
  group = augroup("checktime", { clear = true }),
  command = "checktime",
})

autocmd("VimResized", {
  desc = "Resize splits if window got resized",
  group = augroup("resize_splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

autocmd("BufReadPost", {
  desc = "Go to last loc when opening a buffer",
  group = augroup("last_loc", { clear = true }),
  callback = function(args)
    local exclude = { "gitcommit" }
    local buf = args.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then return end
    vim.b[buf].last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

autocmd("FileType", {
  desc = "Unlist quickfist buffers",
  group = augroup("unlist_quickfist", { clear = true }),
  pattern = "qf",
  callback = function() vim.opt_local.buflisted = false end,
})

autocmd("FileType", {
  desc = "Close some file type with q",
  group = augroup("close_with_q", { clear = true }),
  pattern = { "help", "nofile", "qf" },
  callback = function(args)
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      desc = "Close window",
      buffer = args.buf,
      silent = true,
      nowait = true,
    })
  end,
})

autocmd("FileType", {
  desc = "Wrap and check for spell in text filetypes",
  group = augroup("wrap_spell", { clear = true }),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

autocmd("BufWritePre", {
  desc = "Auto create dir when saving a file, in case some intermediate directory does not exist",
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(args)
    if args.match:match("^%w%w+://") then return end
    local file = vim.loop.fs_realpath(args.match) or args.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

autocmd("WinScrolled", {
  desc = "Refresh indent blankline on window scroll",
  group = augroup("indent_blankline_refresh_scroll", { clear = true }),
  callback = function() pcall(vim.cmd.IndentBlanklineRefresh) end,
})
