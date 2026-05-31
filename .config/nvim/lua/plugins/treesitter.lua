local filetypes = {
  "bash",
  "go",
  "html",
  "javascript",
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
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      require("nvim-treesitter").install(install_languages):wait(300000)

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
