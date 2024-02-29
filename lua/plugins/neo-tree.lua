return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function() require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() }) end,
      desc = "Neotree (cwd)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = require("utils.fs").root_dir(),
        })
      end,
      desc = "Neotree (root)",
    },
  },
  init = function()
    -- Get file system statistics for the current buffer
    local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(0))

    -- Check if stats exist and if the type is a directory
    if stats and stats.type == "directory" then
      -- If the current buffer represents a directory, initialize the Neo Tree plugin
      require("neo-tree")
    end
  end,
  opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    popup_border_style = "rounded",
    sources = { "filesystem" },
    default_component_configs = {
      indent = {
        padding = 0,
      },
      modified = { symbol = "" },
      git_status = {
        symbols = require("icons").git,
      },
    },
    commands = {
      parent_or_close = function(state)
        -- Get the current node from the state tree
        local node = state.tree:get_node()

        -- Check if the current node has children and is expanded
        if node:has_children() and node:is_expanded() then
          -- If the node has children and is expanded, toggle the node (collapse it)
          state.commands.toggle_node(state)
        else
          -- If the node does not have children or is not expanded,
          -- focus on its parent node by calling the focus_node function from the renderer module
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        -- Get the current node from the state tree
        local node = state.tree:get_node()

        -- Check if the current node has children
        if node:has_children() then
          -- If the node has children, check if it's expanded
          if not node:is_expanded() then
            -- If the node is not expanded, toggle the node to expand it
            state.commands.toggle_node(state)
          else
            -- If the node is expanded, check if it's a file or directory node
            if node.type == "file" then
              -- If it's a file node, open the file
              state.commands.open(state)
            else
              -- If it's a directory node, focus on the first child node
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
        else
          -- If the node does not have children, simply open the file (if it's a file node)
          state.commands.open(state)
        end
      end,
    },
    window = {
      width = 35,
      mappings = {
        ["<Space>"] = false, -- disable space until we figure out which-key disabling
        h = "parent_or_close",
        l = "child_or_open",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = vim.fn.has("win32") ~= 1,
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_) vim.opt_local.signcolumn = "auto" end,
      },
    },
  },
}
