return {
  -- Colorschemes
  'folke/tokyonight.nvim',
  'nordtheme/vim',
  'navarasu/onedark.nvim',
  {
    'AlexvZyl/nordic.nvim',
    name = "nordic",
    config = function()
      require("nordic").setup({
        reduced_blue = true,
        bright_border = true,
        italic_comments = true,
        transparent = {
          bg = true,
        },
        telescope = {
          style = 'classic',
        }
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        float = {
          transparent = true,
          solid = true,
        },
        styles = {
          -- properties = {"bold"},
        },
        highlight_overrides = {
          mocha = function(mocha)
            return {
              LineNr = { fg = mocha.overlay1 },
            }
          end,
        },
        integrations = {
          mason = true,
          cmp = true,
          notify = true,
        }
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

        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
      end

      -- ColorMyPencils("nordic")
      -- ColorMyPencils("onedark")
      -- ColorMyPencils("tokyonight")
      -- ColorMyPencils("rose-pine")
      ColorMyPencils("catppuccin")

    end
  },
}
