local M = {}

---Toggle a terminal with specified options.
---@param options {cmd: string, count?: number, direction?: string, size?: number}
function M.toggle(options)
  local Terminal = require("toggleterm.terminal").Terminal

  local term = Terminal:new({
    cmd = options.cmd,
    count = options.count,
    direction = options.direction,
  })

  term:toggle(options.size, options.direction)
end

return M
