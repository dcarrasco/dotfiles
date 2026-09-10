return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  -- LSP Support
  {
    'neovim/nvim-lspconfig',
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
        'mason-org/mason.nvim',
        'neovim/nvim-lspconfig',
    },
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        'lua_ls',
      },
    },
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
    end
  },
  -- Snippets
  -- {'rafamadriz/friendly-snippets'},
  -- DEBUG
  {
    'mfussenegger/nvim-dap',
    dependencies = {
        {'jay-babu/mason-nvim-dap.nvim'},
        {'rcarriga/nvim-dap-ui'},
        {'nvim-neotest/nvim-nio'},
    },
    config = function()
      require('mason-nvim-dap').setup({
        ensure_installed = { 'cpptools' },
        automatic_installation = true,
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      })

      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      local map=function(keys, callback, desc)
        vim.keymap.set("n", keys, callback, {
          silent = true,
          desc = "DAP: " .. desc
        })
      end

      map("<leader>dt", dap.toggle_breakpoint, "Toggle breakpoint")
      map("<leader>dc", dap.continue, "Debug continue")
      map("<leader>dr", dap.repl.open, "Open REPL")
      map("<leader>dk", dap.terminate, "Terminate")
      map("<leader>dso", dap.step_over, "Step over")
      map("<leader>dsi", dap.step_into, "Step into")
      map("<leader>dsu", dap.step_out, "Step out")
      map("<leader>dl", dap.run_last, "Run last")

      map("<leader>duu", dapui.open, "Open UI")
      map("<leader>duc", dapui.close, "Close UI")

      dap.adapters.gdb = {
        type = 'executable',
        command = 'gdb',
        args = { '--interpreter=dap', '--eval-command', 'set print pretty on' }
      }
      dap.configurations.c = {
        {
          name = 'Launch',
          type = 'gdb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          args = {},
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
        {
          name = "Attach to gdb server :1234",
          type = "gdb",
          request = "launch",
          MIMode = 'gdb',
          miDebuggerServerAddress = 'localhost:1234',
          miDebuggerPath = '/usr/bin/gdb/',
          cwd = "${workspaceFolder}",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
        }
      }
    end
  }
}
