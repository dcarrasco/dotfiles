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
      vim.opt.signcolumn = 'yes'

      -- local lspconfig = require('lspconfig')
      -- local lspconfig_defaults = lspconfig.util.default_config
      -- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        -- 'force',
        -- lspconfig_defaults.capabilities,
        -- require('cmp_nvim_lsp').default_capabilities()
      -- )

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
          vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
          vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
          vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)

          vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() vim.fn.feedkeys("zz") end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() vim.fn.feedkeys("zz") end, opts)
          vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format({async = false, timeout_ms = 10000 }) end, opts)
          vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)

          vim.keymap.set("n", "<leader>vl", function() require('lint').try_lint() end, opts)
          vim.keymap.set("n", "<leader>vlq", function() vim.diagnostic.setqflist() end, opts)
        end
      })

      vim.lsp.enable('pylsp', {})
      vim.lsp.enable('lua_ls', {})
      vim.lsp.enable('phpactor', {})
      vim.lsp.enable('ts_ls', {})

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
