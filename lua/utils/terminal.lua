local M = {}

-- Toggle a terminal with specified options.
-- @param options table A table containing options for toggling the terminal.
--   - cmd (string): The command to execute in the terminal.
--   - count (number): Optional. The number of instances of the terminal to toggle. Default is 1.
--   - direction (string): Optional. The direction to toggle the terminal. Default is "horizontal".
--   - size (number): Optional. The size of the terminal to toggle.
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
