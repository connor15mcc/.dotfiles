return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local auto_theme_custom = require("lualine.themes.auto")
    auto_theme_custom.normal.c.bg = "none"
    auto_theme_custom.insert.c.bg = "none"
    auto_theme_custom.command.c.bg = "none"
    auto_theme_custom.replace.c.bg = "none"
    auto_theme_custom.visual.c.bg = "none"
    auto_theme_custom.inactive.c.bg = "none"

    require("lualine").setup({
      options = {
        theme = auto_theme_custom,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      icons_enabled = false,
      globalstatus = true,
      tabline = {
        lualine_a = { { "buffers", icons_enabled = false, symbols = { alternate_file = "" } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "searchcount" },
        lualine_y = { { "filename", path = 1 } },
        lualine_z = { "mode" },
      },
      sections = {},
      inactive_sections = {},
    })
  end,
}
