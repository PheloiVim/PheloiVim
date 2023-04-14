return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    enable_check_bracket_line = true,
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done {})
  end,
}
