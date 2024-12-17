return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      ['<C-p>'] = { 'select_prev' },
      ['<C-n>'] = { 'select_next' },
      ['<C-b>'] = { 'scroll_documentation_down' },
      ['<C-f>'] = { 'scroll_documentation_up' },
      ['<C-j>'] = { 'cancel' },
      ['<C-k>'] = { 'select_and_accept' },
    },
    completion = {
      menu = {
        draw = {
          columns = {
            { 'label', 'label_description' },
          },
        },
      },
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },
  },
  opts_extend = { "sources.default" }
}
