-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- TreeSitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')


    -- tpope's utilities
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('tpope/vim-commentary')

    use('airblade/vim-gitgutter')
    use('jiangmiao/auto-pairs')

    -- Indent guides
    use('lukas-reineke/indent-blankline.nvim')
    use('michaeljsmith/vim-indent-object')


    -- Muestra los mappings de la leader key
    -- use('liuchengxu/vim-which-key')

    -- Simpler way to use some motions (w, b, j, k, f, s)
    -- use('easymotion/vim-easymotion')

    -- Statusline
    use ('kyazdani42/nvim-web-devicons')
    use {
        'nvim-lualine/lualine.nvim',
        -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --
    -- Editor config properties
    use('editorconfig/editorconfig-vim')


    -- Colorschemes
    use('folke/tokyonight.nvim')
    use('arcticicestudio/nord-vim')
    use('navarasu/onedark.nvim')
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd.colorscheme('rose-pine')
        end
    })
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }



    -- LSP ZERO
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

end)
