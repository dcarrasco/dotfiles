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
      local themes = require('telescope.themes')
      local map = function(mode, keys, func, desc)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = "Telescope: " .. desc })
      end

      map('n', '<leader>pf', function() builtin.find_files { hidden = true, no_ignore = true } end, "Show all files (incl. hidden)")
      map('n', '<C-p>', builtin.find_files, "Show files")
      map('n', '<leader>pg', builtin.git_files, "Show git files")
      map('n', '<leader>ev', function() builtin.find_files { cwd = vim.fn.stdpath('config') } end, "Show configuration files")
      map('n', '<leader>ps', function() builtin.grep_string { search = vim.fn.input("Grep > ") } end, "Search text in files")
      map('n', '<leader>ph', builtin.help_tags, "Show help tags")
      map('n', '<leader>pk', builtin.keymaps, "Show keymaps")
      map('n', '<leader>pc', builtin.colorscheme, "Show color schemes")
      map('n', '<leader>s', builtin.lsp_document_symbols, "Show document symbols")
      map('n', 'gr', builtin.lsp_references, "Show references")
      map('n', '<leader><space>', function() builtin.buffers { initial_mode = "normal" } end, "Show buffers")
      map('n', '<tab><tab>', function() builtin.buffers { initial_mode = "normal" } end, "Show buffers")

      map('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown { winblend = 10, previewer = false, })
      end, "Fuzzy search in current buffer")
    end
  },
}

