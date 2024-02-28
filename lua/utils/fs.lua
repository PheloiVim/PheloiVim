local M = {}

-- return root_dir
function M.root_dir()
  local root_dir = vim.fs.dirname(vim.fs.find(require("pheloivim").config.root_patterns, { upward = true, stop = vim.loop.os_homedir() })[1])
  return root_dir
end

return M
