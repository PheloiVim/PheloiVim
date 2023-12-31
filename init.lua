local modules = {
  "pheloivim.bootstrap",
  "pheloivim.config.options",
  "pheloivim.config.keymaps",
  "pheloivim.config.autocmds",
  "pheloivim.config.lazy",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error(("Error loading %s...\n\n%s"):format(module, err))
  end
end
