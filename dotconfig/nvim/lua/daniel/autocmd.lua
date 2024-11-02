vim.api.nvim_create_autocmd("Filetype", {
  pattern = "php",
  -- command = ":set commentstring=//\ %s"
  callback = function()
        vim.opt.commentstring = '// %s'
  end
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
        vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
  end
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
  -- pattern = "*",
  -- command = ":%s/\s\+$//e"
-- })
