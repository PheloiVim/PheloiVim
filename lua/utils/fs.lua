local M = {}

-- return root directory
-- `root_patterns` can be configured in `opts` of PheloiVim
function M.root_dir()
  local root_dir = vim.fs.dirname(
    vim.fs.find(
      require("pheloivim").config.root_patterns,
      { upward = true, stop = vim.uv.os_homedir() }
    )[1]
  )
  return root_dir
end

return M
