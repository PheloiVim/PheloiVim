-- File explorer
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      function() require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() }) end,
      desc = "Neotree (cwd)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = require("utils").root_dir(".git"),
        })
      end,
      desc = "Neotree (root)",
    },
  },
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then require("neo-tree") end
    end
  end,
  deactivate = function() vim.cmd([[Neotree close]]) end,
  opts = {
    auto_clean_after_session_restore = true,
    popup_border_style = "rounded",
    close_if_last_window = true,
    sources = { "filesystem" },
    filesystem = {
      bind_to_cwd = false,
      use_libuv_file_watcher = true,
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_) vim.opt_local.signcolumn = "auto" end,
      },
    },
    window = {
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        h = function(state)
          local node = state.tree:get_node()
          if node:has_children() and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        l = function(state)
          local node = state.tree:get_node()
          if node:has_children() then
            if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
            else -- if expanded and has children, seleect the next child
              if node.type == "file" then
                state.commands.open(state)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
              end
            end
          else -- if has no children
            state.commands.open(state)
          end
        end,
      },
    },
    default_component_configs = {
      indent = {
        padding = 0,
      },
      git_status = {
        symbols = require("pheloivim.icons").git,
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Refresh Neo-Tree sources when closing lazygit
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        local manager_ok, manager = pcall(require, "neo-tree.sources.manager")
        if manager_ok then
          for _, source in ipairs({ "filesystem", "git_status", "diagnostics" }) do
            local module = "neo-tree.sources." .. source
            if package.loaded[module] then manager.refresh(require(module).name) end
          end
        end
      end,
    })
  end,
}
