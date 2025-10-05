-- lua/plugins/css.lua
return {
  -- Make Mason install the CSS language server package
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css-lsp", -- Mason pkg name (vscode-langservers-extracted)
      })
    end,
  },

  -- Enable the cssls server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          -- optional tweaks:
          settings = {
            css = { validate = true },
            scss = { validate = true },
            less = { validate = true },
          },
        },
      },
    },
  },

  -- Treesitter grammars for better highlighting & folds
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css", "scss", "html" })
    end,
  },
}
