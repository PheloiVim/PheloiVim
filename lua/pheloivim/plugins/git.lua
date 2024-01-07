return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end

        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      end,
    },
  },

  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    ft = { "diff" },
    keys = {
      { "<leader>gnt", "<cmd>Neogit<cr>", desc = "Open Neogit Tab Page" },
      { "<leader>gnc", "<cmd>Neogit commit<cr>", desc = "Open Neogit Commit Page" },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      disable_hint = true,
      signs = { section = { "", "" }, item = { "", "" } },
      disable_commit_confirmation = true,
      integrations = { diffview = true },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Open diff" },
      { "<leader>gdc", "<cmd>tabclose<cr>", desc = "Close diff" },
    },
    cmd = {
      "DiffviewOpen",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    opts = {},
  },
}
