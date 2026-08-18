local function apply_transparency()
  for _, group in ipairs({
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "Pmenu",
    "PmenuSbar",
    "SignColumn",
    "FoldColumn",
    "LineNr",
    "CursorLineNr",
    "EndOfBuffer",
    "WinSeparator",
    "StatusLine",
    "StatusLineNC",
    "StatusLineTerm",
    "StatusLineTermNC",
    "WinBar",
    "WinBarNC",
    "TabLine",
    "TabLineFill",
    "TabLineSel",
    "MsgArea",
    "ModeMsg",
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "WhichKeyFloat",
    "WhichKeyNormal",
    "LspInfoBorder",
  }) do
    local current = vim.api.nvim_get_hl(0, { name = group, link = false })
    current.bg = nil
    current.ctermbg = nil
    vim.api.nvim_set_hl(0, group, current)
  end
end

local function apply_dimmed_silentium()
  local function dim_channel(value)
    return math.max(0, math.floor(value * 0.95))
  end

  local function dim_color(color)
    local red = math.floor(color / 0x10000) % 0x100
    local green = math.floor(color / 0x100) % 0x100
    local blue = color % 0x100
    return dim_channel(red) * 0x10000 + dim_channel(green) * 0x100 + dim_channel(blue)
  end

  for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
    local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if ok and current.fg then
      current.fg = dim_color(current.fg)
      current.ctermfg = nil
      vim.api.nvim_set_hl(0, group, current)
    end
  end
end

local function apply_accents()
  local cyan = "#33b1ff"
  local yellow = "#f6ce4e"
  local orange = "#ff9f43"

  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  local function fg(group, fallback)
    local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    return ok and current.fg or fallback
  end

  local silentium_function_call = fg("@function.call", fg("Function", 0xe6e6e6))

  for _, group in ipairs({
    "@comment.documentation",
    "@string.documentation",
    "@lsp.typemod.comment.documentation",
    "@lsp.typemod.string.documentation",
  }) do
    hi(group, { fg = yellow, italic = true })
  end

  for _, group in ipairs({
    "Function",
    "@function",
    "@keyword.function",
    "@keyword.function.rust",
    "@keyword.function.lua",
    "@keyword.function.javascript",
    "@keyword.function.typescript",
    "@keyword.function.tsx",
    "@keyword.function.svelte",
    "@lsp.typemod.function.declaration",
    "@lsp.typemod.method.declaration",
    "@variable.parameter",
    "@variable.parameter.builtin",
    "@lsp.type.parameter",
    "@lsp.typemod.parameter.declaration",
    "@lsp.typemod.parameter.readonly",
    "LspSignatureActiveParameter",
  }) do
    hi(group, { fg = orange })
  end

  for _, group in ipairs({
    "@function.builtin",
    "@function.call",
    "@function.macro",
    "@function.method",
    "@function.method.call",
    "@method",
    "@lsp.type.function",
    "@lsp.type.method",
    "@lsp.typemod.function.readonly",
  }) do
    hi(group, { fg = silentium_function_call })
  end
end


return {
  {
    "silentium-theme/silentium.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("silentium")
      apply_transparency()
      apply_dimmed_silentium()
      apply_accents()
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options
      require("kanagawa").setup({
        background = {
          dark = "wave",
          light = "lotus",
        },
        -- Transparency is handled by Ghostty terminal
        transparent = true,

        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
                bg_m3 = "#2A2A37",
                -- make md checkboxes always the same color (highlighted or not)
                fg_reverse = "#FF9E3B",
              },
              diag = {
                -- info = "none",
                -- make hints less bright
                hint = "#658594",
                -- make TODOs yellow
                -- todo def: https://github.com/rebelot/kanagawa.nvim/blob/e5f7b8a804360f0a48e40d0083a97193ee4fcc87/lua/kanagawa/highlights/treesitter.lua#L107
                -- color def: https://github.com/rebelot/kanagawa.nvim/blob/e5f7b8a804360f0a48e40d0083a97193ee4fcc87/lua/kanagawa/colors.lua#L28C20-L28C27
                hint = "#658594",
              },
            },
          }, -- no background for sign/line gutter
        },

        overrides = function(colors)
          local theme = colors.theme
          return {
            Todo = { bg = "none", fg = theme.diag.warning },
            Comment = { fg = theme.syn.special2 },
          }
        end,
      })
    end,
  },
}
