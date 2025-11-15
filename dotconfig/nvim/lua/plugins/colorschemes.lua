return {
  -- Colorschemes
  'folke/tokyonight.nvim',
  'arcticicestudio/nord-vim',
  'navarasu/onedark.nvim',
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        styles = {
          italic = false,
          transparency = true,
        },
      })

      function ColorMyPencils(color)
        color = color or "catppuccin"
        vim.cmd.colorscheme(color)

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
      end

      -- ColorMyPencils("nord")
      -- ColorMyPencils("onedark")
      -- ColorMyPencils("tokyonight")
      -- ColorMyPencils("rose-pine")
      ColorMyPencils("catppuccin")

    end
  },
}
