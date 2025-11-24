local keymap = vim.keymap
local opts = { noremap = "true", silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "<C-z>", "")


-- ############################################################################
-- Keyboard Mappings from .vimrc
-- ############################################################################

keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Show Netrw file manager" })
keymap.set("n", "<Leader>ep", ":e ~/.config/nvim/lua/plugins<CR>", { desc = "Show plugins files" })
keymap.set("n", "<Leader>et", ":e ~/.tmux.conf<CR>", { desc = "Open tmux config" })
keymap.set("n", "<esc>", ":noh<CR>", { silent = true, desc = "Hide search highlight" })
keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
keymap.set("n", "<Leader>w", ":w<CR>", { silent = true, desc = "Save file" })
keymap.set("n", "<Leader>f", ":tj <c-r><c-w><CR>")
-- keymap.set("n", "<Leader>i", ":call PhpInsertUse()<CR>")

keymap.set("n", "<Leader>h", ":tab help<space>", { desc = "Show help" })
keymap.set("n", "Q", "<nop>")       -- Disable anoying ex modedir
keymap.set("n", "<C-x>", ":<Up>", { desc = "Show last command" })   -- Last command


-- Latam Keyboard mgmt --------------------------------------------------------
keymap.set("n", "ñ", ":")
keymap.set("n", "¿", "/")
keymap.set("n", "<f3>", "<c-]>")


-- US Keyboard mgmt -----------------------------------------------------------
-- keymap.set("n", ";", ":")
-- keymap.set("n", ":", ";")


-- Windows mgmt ---------------------------------------------------------------
keymap.set("n", "<Leader>vs", ":vsp<CR>", { desc = "Vertical split window" })  -- Vertical Split
keymap.set("n", "<Leader>sp", ":sp<CR>", { desc = "Horizontal split window" })   -- Horizontal Split
keymap.set("n", "<Leader>m", ":only<CR>", { desc = "Maximize window" })  -- Maximizes window
keymap.set("n", "<Leader>c", ":close<CR>", { desc = "Close window" }) -- Close the window
-- Move to window
keymap.set("n", "<c-j>", "<c-w>j", { silent=true, desc = "Move focus to down window" })
keymap.set("n", "<c-k>", "<c-w>k", { silent=true, desc = "Move focus to up window" })
keymap.set("n", "<c-h>", "<c-w>h", { silent=true, desc = "Move focus to left window" })
keymap.set("n", "<c-l>", "<c-w>l", { silent=true, desc = "Move focus to right window" })
-- Resize window
keymap.set("n", "<M-Up>", ":resize +5<CR>", { desc = "Resize window 5 lines up" })
keymap.set("n", "<M-Down>", ":resize -5<CR>", { desc = "Resize window 5 lines down" })
keymap.set("n", "<M-Left>", ":vertical resize +5<CR>", { desc = "Resize window 5 columns left" })
keymap.set("n", "<M-Right>", ":vertical resize -5<CR>", { desc = "Resize window 5 columns right" })


-- Buffer related -------------------------------------------------------------
keymap.set("n", "<f5>", ":buffers<CR>:buffer<space>", { desc = "Show list of open buffers to select" })
keymap.set("n", "<c-s-tab>", ":bp<CR>")
keymap.set("n", "<c-tab>", ":bn<CR>")
keymap.set("n", "[b", ":bp<CR>", { desc = "Switch to previous buffer" })
keymap.set("n", "]b", ":bn<CR>", { desc = "Switch to next buffer" })
keymap.set("n", "<Leader><s-tab>", ":bp<CR>", { desc = "Switch to previous buffer" })
keymap.set("n", "<Leader><tab>", ":bn<CR>", { desc = "Switch to next buffer" })
keymap.set("n", "<S-h>", ":bp<CR>", { desc = "Switch to previous buffer" })
keymap.set("n", "<S-l>", ":bn<CR>", { desc = "Switch to next buffer" })
-- keymap.set("n", "<tab>", ":b<space>")
keymap.set("n", "<Leader>q", ":bd<CR>", { desc = "Close and unloads buffer" })
-- open previous buffer
keymap.set("n", "<Leader>bp", ":bp<CR>", { desc = "Switch to previous buffer" })
keymap.set("n", "<Leader>bn", ":bn<CR>", { desc = "Switch to next buffer" })
keymap.set("n", "<Leader>bd", ":bd<CR>", { desc = "Close and unloads buffer" })
keymap.set("n", "<Leader>bb", ":b#<CR>", { desc = "Switch to last buffer" })


-- Copy / register mgmt ------------------------------------------------------------------
keymap.set("x", "<leader>p", "\"_dP")
keymap.set("n", "x", '"_x', opts)    -- prevents deleted character from copying to clipboard

-- Movement mgmt --------------------------------------------------------------
keymap.set("n", "'", "`")
keymap.set("n", "`", "'")
keymap.set("i", "jj", "<Esc>")
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "*", "*zzzv")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")
keymap.set("n", "0", "^")
keymap.set("n", "0", "^")
keymap.set("n", "^", "0")
keymap.set("n", "^", "0")
-- keymap.set("n", "9", "$")
-- keymap.set("n", "9", "$")
keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll one window forward" })
keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll one window back" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half window up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half window down" })


-- Terminal mgmt --------------------------------------------------------------
keymap.set("n", "<Leader>tt", function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  vim.cmd.startinsert()
end, { desc = "Open a terminal window at bottom" })
keymap.set("t", "<Esc>", "<C-\\><C-N>")
-- keymap.set("t", "<expr>", "<Esc> (&filetype == "fzf") ? "<Esc>-- : "<C-\><C-n>"")
-- Move to window
-- keymap.set("t", "<c-j>", "<c-w>j")
-- keymap.set("t", "<c-k>", "<c-w>k")
-- keymap.set("t", "<c-h>", "<c-w>h")
-- keymap.set("t", "<c-l>", "<c-w>l")

-- Execute lua ----------------------------------------------------------------
keymap.set('n', '<Leader>x', ':.lua<CR>')
keymap.set('v', '<Leader>x', ':lua<CR>')
keymap.set('n', '<Leader><C-x>', ':source %<CR>', { desc = "Source current file" })

-- Text mgmt ------------------------------------------------------------------
keymap.set({"o", "v"}, "q", "i\"")
keymap.set({"o", "v"}, "'", "i'")
keymap.set({"o", "v"}, "p", "i(")
keymap.set({"o", "v"}, "f", "i{")
keymap.set({"o", "v"}, "b", "i[")

keymap.set("n", "Y", "y$")
-- Junta lineas sin mover cursor
keymap.set("n", "J", "mzJ`z")
-- nnoremap <C-p> "0p
-- paste from yank
-- nnoremap <C-S-p> "0P
-- Inserta espacio y enter
-- keymap.set("n", "<C-enter>", "i <esc>")
keymap.set("n", "x", '"_x')


-- Select mgmt ----------------------------------------------------------------
keymap.set("v", "v", "V")
keymap.set("v", ">", ">gv", opts) -- indentar sin perder la seleccion
keymap.set("v", "<", "<gv", opts) -- indentar sin perder la seleccion
keymap.set("v", "J", ":move '>+1<CR>gv=gv") -- Mueve lineas hacia abajo
keymap.set("v", "K", ":move '<-2<CR>gv=gv") -- Mueve lineas hacia arriba

--
-- Jump mgmt ----------------------------------------------------------------
keymap.set("n", "[[", "[[zz")
keymap.set("n", "]]", "]]zz")
keymap.set("n", "qf", ":copen<CR>", { desc = "Open quickfix window" })
keymap.set("n", "[q", ":cp<CR>zz", { desc = "Jump to previous quickfix item" })
keymap.set("n", "]q", ":cn<CR>zz", { desc = "Jump to next quickfix item" })
keymap.set("n", "[Q", ":cfirst<CR>zz", { desc = "Jump to first quickfix item" })
keymap.set("n", "]Q", ":clast<CR>zz", { desc = "Jump to last quickfix item" })
keymap.set("n", "<Leader>k", ":cprev<CR>zz", { desc = "Jump to previous quickfix item" })
keymap.set("n", "<Leader>j", ":cnext<CR>zz", { desc = "Jump to next quickfix item" })
keymap.set("n", "[m", "[mzz", { desc = "Jump to previous start of method" })
keymap.set("n", "]m", "]mzz", { desc = "Jump to next start of method" })
keymap.set("n", "[M", "[Mzz", { desc = "Jump to previous end of method" })
keymap.set("n", "]M", "]Mzz", { desc = "Jump to next end of method" })

-- Salta entre tags
keymap.set("n", "[t", ":tprevious<CR>")
keymap.set("n", "]t", ":tnext<CR>")
keymap.set("n", "[l", ":lp<CR>zz")
keymap.set("n", "]l", ":lnext<CR>zz")
keymap.set("n", "[L", ":lfirst<CR>zz")
keymap.set("n", "]L", ":llast<CR>zz")


-- --------------- Config Status Line ------------------------------------------
keymap.set("n", "<Leader>cc", ":lua ColorMyPencils()<CR>")
