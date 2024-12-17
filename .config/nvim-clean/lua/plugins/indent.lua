return {
  {
    -- responsible for animating
    'echasnovski/mini.indentscope',
    version = false,
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    -- provides static symbol
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
    },
  },
}
