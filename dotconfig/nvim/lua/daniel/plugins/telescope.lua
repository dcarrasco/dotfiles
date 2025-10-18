return {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.8",
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      require('telescope').setup {
        pickers = {
          buffers = { theme = "ivy", sort_mru = true, sort_lastused = true },
          colorscheme = { theme = "dropdown", enable_preview = true }
        }
      }

      local builtin = require('telescope.builtin')
      -- local themes = require('telescope.themes')

      vim.keymap.set('n', '<leader>pf', function()
        builtin.find_files { hidden = true, no_ignore = true }
      end)
      vim.keymap.set('n', '<C-p>', builtin.find_files)
      vim.keymap.set('n', '<leader>pg', builtin.git_files)
      vim.keymap.set('n', '<leader>ev', function()
        builtin.find_files { cwd = vim.fn.stdpath('config') }
      end)
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string { search = vim.fn.input("Grep > ") }
      end)
      vim.keymap.set('n', '<leader>ph', builtin.help_tags)
      vim.keymap.set('n', '<leader>pk', builtin.keymaps)
      vim.keymap.set('n', '<leader>pc', builtin.colorscheme)

      vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols)
      vim.keymap.set('n', 'gr', builtin.lsp_references)

      vim.keymap.set('n', '<leader><space>', function()
        builtin.buffers { initial_mode = "normal" }
      end)
      vim.keymap.set('n', '<tab><tab>', function()
        builtin.buffers { initial_mode = "normal" }
      end)

      vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end)
    end
  },
}

