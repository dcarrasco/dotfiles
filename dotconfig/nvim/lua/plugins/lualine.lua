return {
  -- Statusline
  'kyazdani42/nvim-web-devicons',

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          -- theme = 'nord',
          theme = 'material',
          -- theme = 'catppuccin',
          -- theme = 'base16',
        }
      })
    end
  }

}
