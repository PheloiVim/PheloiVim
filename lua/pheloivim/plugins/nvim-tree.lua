return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
  },
  opts = {
    view = {
      width = 40,
      number = true,
      relativenumber = true,
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

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
