vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup('custom-php-prefs', { clear = true }),
  pattern = "php",
  -- command = ":set commentstring=//\ %s"
  callback = function()
        vim.opt.commentstring = '// %s'
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup('custom-lua-prefs', { clear = true }),
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch' }
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
  -- pattern = "*",
  -- command = ":%s/\s\+$//e"
-- })
