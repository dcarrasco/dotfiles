return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
        {'williamboman/mason-lspconfig.nvim'},
        {'sbdchd/neoformat'},
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lua_ls = function()
          end,
        },
      })
    end
  },

  -- LINTER
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        python = {'pylint'},
        php = {'phpstan'},
        rust = {'bacon-ls'}
      }
    end
  }

  -- Snippets
  -- {'rafamadriz/friendly-snippets'},
}
