return {
  "glepnir/lspsaga.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return {
      ui = {
        kind = {
          File = { "󰈔 ", "LspKindFile" },
          Module = { " ", "LspKindModule" },
          Namespace = { " ", "LspKindNamespace" },
          Package = { " ", "LspKindPackage" },
          Class = { " ", "LspKindClass" },
          Method = { " ", "LspKindMethod" },
          Property = { " ", "LspKindProperty" },
          Field = { " ", "LspKindField" },
          Constructor = { " ", "LspKindConstructor" },
          Enum = { " ", "LspKindEnum" },
          Interface = { " ", "LspKindInterface" },
          Function = { "󰊕 ", "LspKindFunction" },
          Variable = { " ", "LspKindVariable" },
          Constant = { " ", "LspKindConstant" },
          String = { "󰅳 ", "LspKindString" },
          Number = { "󰉻 ", "LspKindNumber" },
          Boolean = { " ", "LspKindBoolean" },
          Array = { " ", "LspKindArray" },
          Object = { "󰐾 ", "LspKindObject" },
          Key = { "󰌋 ", "LspKindKey" },
          Null = { "󰟢 ", "LspKindNull" },
          EnumMember = { " ", "LspKindEnumMember" },
          Struct = { " ", "LspKindStruct" },
          Event = { " ", "LspKindEvent" },
          Operator = { " ", "LspKindOperator" },
          TypeParameter = { " ", "LspKindTypeParameter" },
          TypeAlias = { " ", "LspKindTypeAlias" },
          Parameter = { " ", "LspKindParameter" },
          StaticMethod = { " ", "LspKindStaticMethod" },
          Macro = { " ", "LspKindMacro" },
          Text = { " ", "LspKindText" },
          Snippet = { " ", "LspKindSnippet" },
          Folder = { " ", "LspKindFolder" },
          Unit = { "󰊱 ", "LspKindUnit" },
          Value = { " ", "LspKindValue" },
        },
      },
      diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        show_virt_line = false,
        show_code_action = false,
      },
      lightbulb = {
        enable = false,
      },
      outline = {
        win_width = 40,
        keys = {
          expand_or_jump = "o",
          quit = "q",
        },
      },
      hover = {
        max_width = 0.5,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
      symbol_in_winbar = {
        separator = "  ",
        show_file = false,
      },
    }
  end,
}
