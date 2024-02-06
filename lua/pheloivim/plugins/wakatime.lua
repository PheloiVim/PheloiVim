return {
  "wakatime/vim-wakatime",
  event = { "BufReadPost", "BufNewFile" },
  setup = function() vim.cmd([[packadd wakatime/vim-wakatime]]) end,
}
