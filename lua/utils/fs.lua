local M = {}

--- Retrieves the root directory of the current project.
--- This function determines the root directory of the current project by searching for
--- predefined root patterns within the file system hierarchy.
--- @return string|nil The root directory path of the current project.
function M.root_dir()
  local root_dir = vim.fs.dirname(
    vim.fs.find(
      require("pheloivim").config.root_patterns,
      { upward = true, stop = vim.loop.os_homedir() }
    )[1]
  )
  return root_dir
end

return M
