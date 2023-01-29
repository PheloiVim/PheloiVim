-- Configs
require "configs.theme"
require "configs.keymaps"
require "configs.options"
require "configs.autocmd"

-- Plugins
require "plugins.plugins"
require "plugins.cmp"
require "plugins.autopairs"
require "plugins.lualine"
require "plugins.comment"
require "plugins.gitsigns"
require "plugins.identline"
require "plugins.hop"
require "plugins.treesitter"
require "plugins.nvim-tree"
require "plugins.telescope"
require "plugins.toggleterm"
require "plugins.impatient"
require "plugins.trouble"
require "plugins.bufferline"


-- LSP
require "lsp.mason"
require "lsp.handlers".setup()
require "lsp.null-ls"
