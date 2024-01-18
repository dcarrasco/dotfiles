return {
    -- Colorschemes
    'folke/tokyonight.nvim',
    'arcticicestudio/nord-vim',
    'navarasu/onedark.nvim',
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd.colorscheme('rose-pine')

            function ColorMyPencils(color)
                -- color = color or "rose-pine"
                color = color or "catppuccin"
                vim.cmd.colorscheme(color)

                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
                -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end

            -- ColorMyPencils("nord")
            -- ColorMyPencils("rose-pine")
            -- ColorMyPencils("catppuccin")
            ColorMyPencils("catppuccin-frappe")

        end
    },

}



