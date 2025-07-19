-- --------------- Interface ---------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"


-- --------------- Tab stop ---------------
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true


-- --------------- Search ---------------
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true


-- --------------- Visuals ---------------
vim.opt.termguicolors = true
vim.opt.scrolloff = 6
vim.opt.colorcolumn = "120"
vim.opt.errorbells = false
vim.opt.showbreak = ".."
vim.opt.wrap = true
vim.opt.showmode= false
vim.opt.showtabline = 1
vim.opt.cursorline = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = "␣" }


-- --------------- File format ---------------
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.tags = "./tags,tags,tags.vendor,.git/tags;"
vim.opt.grepformat = "%f:%l:%m"


-- --------------- Others ---------------

vim.opt.isfname:append("@-@")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 100

vim.g.mapleader = " "

vim.opt.history = 50
vim.opt.autoread = true
-- vim.opt.backspace=indent,eol,start

-- vim.opt.textwidth=0
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- vim.opt.path+=**
-- vim.opt.wildmenu

-- vim.opt.ruler

vim.opt.showcmd = true
vim.opt.title = false
vim.opt.laststatus = 2
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true

