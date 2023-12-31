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
    view = {
      width = 40,
      number = true,
      relativenumber = true,
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set(
        "n",
        "E",
        api.tree.expand_all,
        { desc = "Expand all", buffer = bufnr, noremap = true, silent = true, nowait = true }
      )

      vim.keymap.set(
        "n",
        "C",
        api.tree.collapse_all,
        { desc = "Collapse all", buffer = bufnr, noremap = true, silent = true, nowait = true }
      )

      vim.keymap.set("n", "<Tab>", function()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          api.node.open.edit()
        else
          api.node.open.vertical()
        end
        api.tree.focus()
      end, { desc = "Vsplit Preview", buffer = bufnr, noremap = true, silent = true, nowait = true })

      vim.keymap.set("n", "l", function()
        local node = api.tree.get_node_under_cursor()
        if node.nodes ~= nil then
          api.node.open.edit()
        else
          api.node.open.edit()
          api.tree.close()
        end
      end, { desc = "Edit or open", buffer = bufnr, noremap = true, silent = true, nowait = true })
    end,
  },
}
