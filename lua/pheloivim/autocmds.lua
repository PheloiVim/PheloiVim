local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto create directory when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir", { clear = true }), -- Create autocmd group for auto-creating directory
  callback = function(event)
    -- Check if the file path contains a protocol prefix (e.g., "http://", "ftp://")
    if event.match:match("^%w%w+://") then return end
    -- Get the real path of the file and create its parent directories if they do not exist
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime", { clear = true }), -- Create autocmd group for file reload checking
  callback = function()
    -- Check if the buffer is associated with a file and trigger the 'checktime' command to reload it if needed
    if vim.o.buftype ~= "nofile" then vim.cmd("checktime") end
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_on_yank", { clear = true }), -- Create autocmd group for yank highlighting
  callback = function()
    -- Trigger the 'on_yank' function to highlight the yanked text
    vim.highlight.on_yank()
  end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("resize_splits", { clear = true }), -- Create autocmd group for split resizing
  callback = function()
    -- Get the current tab page number and adjust the window sizes
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Don't list quickfix buffers
autocmd("FileType", {
  group = augroup("dont_list_qf", { clear = true }), -- Create autocmd group for not listing quickfix buffers
  pattern = "qf",
  callback = function()
    -- Set the 'buflisted' option to false for quickfix buffers
    vim.opt_local.buflisted = false
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then return end
    vim.b[buf].last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})
