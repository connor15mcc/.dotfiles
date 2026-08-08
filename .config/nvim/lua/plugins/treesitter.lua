local filetypes = {
  "bash",
  "go",
  "html",
  "javascript",
  "jjdescription",
  "json",
  "lua",
  "markdown",
  "python",
  "query",
  "regex",
  "svelte",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}

local install_languages = {
  "bash",
  "ecma",
  "go",
  "html",
  "html_tags",
  "javascript",
  "jjdescription",
  "diff",
  "comment",
  "json",
  "jsx",
  "lua",
  "markdown",
  "python",
  "query",
  "regex",
  "svelte",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}

return {
  {
    "neovim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "neovim-treesitter/treesitter-parser-registry",
    },
    opts = {
      install_dir = vim.fn.stdpath("data") .. "/site",
      ensure_installed = install_languages,
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      require("config.jjdescription").setup_treesitter_queries()

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
        pattern = filetypes,
        callback = function(args)
          vim.treesitter.start(args.buf)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { max_lines = 1 },
  },
  {
    "bezhermoso/tree-sitter-ghostty",
    build = "make nvim_install",
  },
}
