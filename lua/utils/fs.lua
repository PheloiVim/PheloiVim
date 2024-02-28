local M = {}

function M.root_dir(root_patterns)
  local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true, stop = vim.loop.os_homedir() })[1])
  return root_dir
end

return M
