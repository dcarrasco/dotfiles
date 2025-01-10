return {

    -- tpope's utilities
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gp", function() vim.cmd('Git push') end)
        end
    },
    'tpope/vim-surround',
    'tpope/vim-commentary',

    {
        'airblade/vim-gitgutter',
        config = function ()
            vim.keymap.set("n", "[g", function () vim.cmd('GitGutterPrevHunk') end)
            vim.keymap.set("n", "]g", function () vim.cmd('GitGutterNextHunk') end)
        end
    },
    'jiangmiao/auto-pairs',

    -- Indent guides
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup({
                scope = { enabled = false, }
            })
        end
    },
    'michaeljsmith/vim-indent-object',

    -- Muestra los mappings de la leader key
    -- use('liuchengxu/vim-which-key')

    -- Simpler way to use some motions (w, b, j, k, f, s)
    -- use('easymotion/vim-easymotion')

    -- Editor config properties
    'editorconfig/editorconfig-vim',
}
