return {
    -- Statusline
    'kyazdani42/nvim-web-devicons',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'material',
                    -- theme = 'catppuccin',
                }
            })
        end
    }

}
