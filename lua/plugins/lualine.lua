return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local mode = {
      "mode",
      fmt = function() return " " end,
    }

    local branch = {
      "branch",
      icon = "",
      padding = 1.5,
    }

    local spaces = {
      function() return "Tab size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") end,
      padding = 1.5,
    }

    local progress = {
      "progress",
      fmt = function() return "%P/%L" end,
    }

    opts.options = {
      icons_enabled = true,
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      always_divide_middle = true,
    }
    opts.sections.lualine_a = { mode }
    opts.sections.lualine_b = { branch }
    opts.sections.lualine_y = { spaces }
    opts.sections.lualine_z = { progress }
  end,
}
