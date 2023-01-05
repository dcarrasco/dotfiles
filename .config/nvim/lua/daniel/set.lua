-- --------------- Interface ---------------"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- --------------- Tab stop ---------------"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- --------------- Search ---------------"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 100

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "



vim.opt.errorbells = false
vim.opt.history = 50
vim.opt.autoread = true
-- vim.opt.backspace=indent,eol,start

vim.opt.showbreak = ".."
-- vim.opt.textwidth=0
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.tags = "./tags,tags,tags.vendor,.git/tags;"
vim.opt.grepformat = "%f:%l:%m"

-- vim.opt.path+=**
-- vim.opt.wildmenu

-- vim.opt.ruler

vim.opt.showcmd = true
vim.opt.title = false
vim.opt.laststatus = 2
vim.opt.showmode= false
vim.opt.showtabline = 1
vim.opt.cursorline = true
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true


