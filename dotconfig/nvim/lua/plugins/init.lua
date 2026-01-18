local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

return {

  -- tpope's utilities
  'tpope/vim-surround',
  'tpope/vim-commentary',
  {
    'tpope/vim-fugitive',
    config = function()
      map("n", "<leader>gts", vim.cmd.Git, "Git: View status")
      map("n", "<leader>gtp", function() vim.cmd('Git push') end, "Git: Push")
      map("n", "<leader>gtd", function() vim.cmd('Gvdiffsplit') end, "Git: VDiff")
    end
  },

  -- {
  --   'airblade/vim-gitgutter',
  --   config = function ()
  --     map("n", "[g", function () vim.cmd('GitGutterPrevHunk') end, "Git: Jump to previous change")
  --     map("n", "]g", function () vim.cmd('GitGutterNextHunk') end, "Git: Jump to next change")
  --   end
  -- },

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
