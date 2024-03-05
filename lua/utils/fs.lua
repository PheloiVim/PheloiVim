local M = {}

--- Finds the first directory matching a given pattern, starting from the current working directory and searching upwards until the user's home directory.
--- @param dir_patterns string|table: A table containing one or more directory patterns to search for.
--- @return string|nil: The path of the first matching directory, or `nil` if no match is found.
function M.find_dir(dir_patterns)
  local dir = vim.fs.dirname(vim.fs.find(dir_patterns, { upward = true, stop = vim.loop.os_homedir() })[1])
  return dir
end

return M
