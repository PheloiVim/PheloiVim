return {
  "folke/zen-mode.nvim",
  dependencies = {
    {
      "folke/twilight.nvim",
      opts = {
        treesitter = true,
        exclude = {
          "NvimTree",
        },
      },
    },
  },
  opts = {
    window = {
      backdrop = 1,
      width = function()
        return math.min(120, vim.o.columns * 0.75)
      end,
      height = 0.9,
      options = {
        number = false,
        relativenumber = false,
        foldcolumn = "0",
        list = false,
        showbreak = "NONE",
        signcolumn = "no",
      },
    },
    plugins = {
      options = {
        cmdheight = 1,
        laststatus = 0,
      },
    },
    on_open = function() -- disable diagnostics, indent blankline, winbar, and offscreen matchup
      vim.g.diagnostics_mode_old = vim.g.diagnostics_mode
      vim.g.diagnostics_mode = 0
      vim.g.indent_blankline_enabled_old = vim.g.indent_blankline_enabled
      vim.g.indent_blankline_enabled = false
      vim.g.miniindentscope_disable_old = vim.g.miniindentscope_disable
      vim.g.miniindentscope_disable = true

      vim.g.winbar_old = vim.o.winbar
      vim.api.nvim_create_autocmd({ "BufWinEnter", "BufNew" }, {
        pattern = "*",
        callback = function()
          vim.o.winbar = nil
        end,
        group = vim.api.nvim_create_augroup("disable_winbar", { clear = true }),
        desc = "Ensure winbar stays disabled when writing to file, switching buffers, opening floating windows, etc.",
      })
    end,
    on_close = function() -- restore diagnostics, indent blankline, winbar, and offscreen matchup
      vim.g.diagnostics_mode = vim.g.diagnostics_mode_old
      vim.g.indent_blankline_enabled = vim.g.indent_blankline_enabled_old
      vim.g.miniindentscope_disable = vim.g.miniindentscope_disable_old
      if vim.g.indent_blankline_enabled_old then
        vim.cmd("IndentBlanklineRefresh")
      end

      vim.api.nvim_clear_autocmds({ group = "disable_winbar" })
      vim.o.winbar = vim.g.winbar_old
    end,
  },
}
