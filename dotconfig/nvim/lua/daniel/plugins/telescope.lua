return {
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = "0.1.5",
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('telescope').setup({})

            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>pf', ':Telescope find_files no_ignore=true<CR>', { silent = true })
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<C-S-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
            vim.keymap.set('n', '<leader>ph', ':Telescope help_tags<CR>:only<CR>', { silent = true })
            vim.keymap.set('n', '<leader>pk', ':Telescope keymaps<CR>', { silent = true })

            vim.keymap.set('n', '<leader>s', ':Telescope lsp_document_symbols<CR>', { silent = true })
            vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', { silent = true })
            vim.keymap.set('n', '<leader><space>', ':Telescope buffers<CR>', { silent = true })
            vim.keymap.set('n', '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end)
        end
    },
}

