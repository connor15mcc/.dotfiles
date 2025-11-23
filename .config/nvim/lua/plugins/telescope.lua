return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<CR>",                desc = "Find Files (Root Dir)" },
      {
        "<leader>fb",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<CR>",
        desc = "Buffers",
      },
      { "<leader>ff",      "<cmd>Telescope find_files<CR>",                desc = "Find Files (Root Dir)" },
      { "<leader>fF",      "<cmd>Telescope find_files<CR>",                { root = false },                    desc = "Find Files (cwd)" },
      { "<leader>fg",      "<cmd>Telescope git_files<CR>",                 desc = "Find Files (git-files)" },
      { "<leader>fr",      "<cmd>Telescope oldfiles<CR>",                  desc = "Recent" },
      { "<leader>fR",      "<cmd>Telescope oldfiles<CR>",                  { cwd = vim.uv.cwd() },              desc = "Recent (cwd)" },
      {
        "<leader>ft",
        function()
          require("telescope.builtin").treesitter({
          })
        end,
        desc = "Find treesitter objects",
      },
      {
        "<leader>fs",
        function()
          require("telescope.builtin").lsp_document_symbols()
        end,
        desc = "Find LSP symbols",
      },
      -- git
      { "<leader>gc",      "<cmd>Telescope git_commits<CR>",               desc = "Commits" },
      { "<leader>gs",      "<cmd>Telescope git_status<CR>",                desc = "Status" },
      -- search
      { '<leader>s"',      "<cmd>Telescope registers<CR>",                 desc = "Registers" },
      { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer" },
      { "<leader>sc",      "<cmd>Telescope command_history<CR>",           desc = "Command History" },
      { "<leader>sC",      "<cmd>Telescope commands<CR>",                  desc = "Commands" },
      { "<leader>sd",      "<cmd>Telescope diagnostics bufnr=0<CR>",       desc = "Document Diagnostics" },
      { "<leader>sD",      "<cmd>Telescope diagnostics<CR>",               desc = "Workspace Diagnostics" },
      { "<leader>sg",      "<cmd>Telescope live_grep<CR>",                 desc = "Grep (Root Dir)" },
      { "<leader>sG",      "<cmd>Telescope live_grep<CR>",                 { root = false },                    desc = "Grep (cwd)" },
      { "<leader>sj",      "<cmd>Telescope jumplist<CR>",                  desc = "Jumplist" },
      { "<leader>sk",      "<cmd>Telescope keymaps<CR>",                   desc = "Key Maps" },
      { "<leader>sM",      "<cmd>Telescope man_pages<CR>",                 desc = "Man Pages" },
      { "<leader>sm",      "<cmd>Telescope marks<CR>",                     desc = "Jump to Mark" },
      { "<leader>so",      "<cmd>Telescope vim_options<CR>",               desc = "Options" },
      { "<leader>sR",      "<cmd>Telescope resume<CR>",                    desc = "Resume" },
      { "<leader>sq",      "<cmd>Telescope quickfix<CR>",                  desc = "Quickfix List" },
      { "<leader>sw",      "<cmd>Telescope grep_string<CR>",               { word_match = "-w" },               desc = "Word (Root Dir)" },
      { "<leader>sW",      "<cmd>Telescope grep_string<CR>",               { root = false, word_match = "-w" }, desc = "Word (cwd)" },
      { "<leader>uC",      "<cmd>Telescope colorscheme<CR>",               { enable_preview = true },           desc = "Colorscheme with Preview" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "bottom_pane",
          layout_config = { prompt_position = "bottom", height = 25 },
          sorting_strategy = "descending",
          hidden = true,
          winblend = 0,
          prompt_prefix = ">",
          border = false,
          entry_prefix = "",
          results_title = false,
          prompt_title = false,
          file_sorter = require("telescope.sorters").get_fzy_sorter,
        },
        pickers = {
          find_files = {
            disable_devicons = true,
          },
        },
      })
    end
  },
}
