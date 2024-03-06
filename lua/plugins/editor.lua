return {
  {
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
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.loop.cwd(),
          })
        end,
        desc = "Neotree (cwd)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = require("utils.fs").find_dir(".git"),
          })
        end,
        desc = "Neotree (root)",
      },
    },
    init = function()
      -- Get file system statistics for the current buffer
      local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))

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
          symbols = {},
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
          handler = function(_)
            vim.opt_local.signcolumn = "auto"
          end,
        },
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "CmdLineEnter",
    opts = {
      search = {
        mode = "fuzzy",
      },
      modes = {
        char = {
          keys = { "f", "F" },
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
      "f",
      "F",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "▎" },
      },
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")
        map("n", "<leader>ghb", function()
          gs.blameline({ full = true })
        end, "Blame line")
        map({ "n", "v" }, "<leader>ghs", gs.stage_hunk, "Stage hunk")
        map({ "n", "v" }, "<leader>ghr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk")
        map("n", "<leader>ud", gs.toggle_deleted, "Toggle deleted")
      end,
    },
  },
}
