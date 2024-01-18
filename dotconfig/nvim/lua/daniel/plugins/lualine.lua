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
                }
            })

            local num_args = vim.api.nvim_eval(vim.api.nvim_exec('echo argc()', true))
            if num_args == 0 then
                vim.api.nvim_exec('intro', false)
            end

        end
    }

}
