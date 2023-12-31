return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
  },
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("nvim-tree")
      end
    end
  end,
  opts = {
    disable_netrw = true,
    sync_root_with_cwd = false,
    view = {
      width = 40,
      number = true,
      relativenumber = true,
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")
      api.config.mappings.default_on_attach(bufnr)

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, noremap = true, silent = true, nowait = true })
      end

      map("n", "E", api.tree.expand_all, "Expand all")
      map("n", "C", api.tree.collapse_all, "Collapse all")
      map("n", "<Tab>", function()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          api.node.open.edit()
        else
          api.node.open.vertical()
        end
        api.tree.focus()
      end, "Vsplit Preview")
      map("n", "l", function()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          api.node.open.edit()
        else
          api.node.open.edit()
          api.tree.close()
        end
      end, "Edit or open")
    end,
  },
}
