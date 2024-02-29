return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    disable_filetype = { "TelescopePrompt" },
    check_ts = true,
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = ([[ [%'%"%)%>%]%)%}%,] ]]):gsub("%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
    },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ tex = false }))
  end,
}
