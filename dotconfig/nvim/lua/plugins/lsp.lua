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
        python = {'pylint', 'mypy'},
        php = {'phpstan'},
        rust = {'bacon-ls'}
      }

      -- lint.linters.pylint.cmd = 'python'
      -- lint.linters.pylint.args = { '-m', 'python', '-f', 'json' }

      vim.api.nvim_create_user_command("LintInfo", function()
        local filetype = vim.bo.filetype
        local linters = lint.linters_by_ft[filetype]
        if linters then
          print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
        else
          print("No linters configured for filetype: " .. filetype)
        end
      end, {})

      local lint_progress = function()
        local linters = lint.get_running()
        if #linters == 0 then
          return "󰦕 "
        end
        return "󱉶 " .. table.concat(linters, ", ")
      end

      vim.diagnostic.config({
        float = {
          source = true,
          border = 'rounded'
        },
        virtual_text = {
          prefix = "●",
          source = false,
        },
        signs = {
          text = {
            --     ⚑   󰅙
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '',
          },
        },
      })

    end
  }

  -- Snippets
  -- {'rafamadriz/friendly-snippets'},
}
