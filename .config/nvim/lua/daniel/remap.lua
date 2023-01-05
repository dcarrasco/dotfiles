vim.keymap.set("x", "<leader>p", "\"_dP")


-- ############################################################################
-- Keyboard Mappings from .vimrc
-- ############################################################################

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<Leader>ev", ":e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<Leader>ep", ":e ~/.vim/plugins.vim<CR>")
vim.keymap.set("n", "<Leader>et", ":e ~/.tmux.conf<CR>")
vim.keymap.set("n", "<esc>", ":noh<CR>", { silent = true })
vim.keymap.set("n", "<Leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<Leader>f", ":tj <c-r><c-w><CR>")
-- vim.keymap.set("n", "<Leader>s", ":TlistToggle<CR>")
-- vim.keymap.set("n", "<Leader>i", ":call PhpInsertUse()<CR>")

vim.keymap.set("n", "<Leader>h", ":tab help<space>")
-- Disable anoying ex mode
vim.keymap.set("n", "Q", "<nop>")
-- Last command
vim.keymap.set("n", "<C-x>", ":<Up>")


-- Latam Keyboard mgmt --------------------------------------------------------
vim.keymap.set("n", "ñ", ":")
vim.keymap.set("n", "¿", "/")
vim.keymap.set("n", "<f3>", "<c-]>")


-- US Keyboard mgmt -----------------------------------------------------------
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")


-- Windows mgmt ---------------------------------------------------------------
-- Vertical Split
vim.keymap.set("n", "<Leader>vs", ":vsp<CR>")
-- Horizontal Split
vim.keymap.set("n", "<Leader>sp", ":sp<CR>")
-- Maximizes window
vim.keymap.set("n", "<Leader>m", ":only<CR>")
-- Close the window
vim.keymap.set("n", "<Leader>c", ":close<CR>")
-- Move to window
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
-- Resize window
vim.keymap.set("n", "<M-Up>", ":resize +5<CR>")
vim.keymap.set("n", "<M-Down>", ":resize -5<CR>")
vim.keymap.set("n", "<M-Left>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<M-Right>", ":vertical resize -5<CR>")


-- Buffer related -------------------------------------------------------------
vim.keymap.set("n", "<f5>", ":buffers<CR>:buffer<space>")
vim.keymap.set("n", "<c-s-tab>", ":bp<CR>")
vim.keymap.set("n", "<c-tab>", ":bn<CR>")
vim.keymap.set("n", "[b", ":bp<CR>")
vim.keymap.set("n", "]b", ":bn<CR>")
vim.keymap.set("n", "<Leader><s-tab>", ":bp<CR>")
vim.keymap.set("n", "<Leader><tab>", ":bn<CR>")
vim.keymap.set("n", "<S-l>", ":bn<CR>")
vim.keymap.set("n", "<S-h>", ":bp<CR>")
vim.keymap.set("n", "<tab>", ":b<space>")
vim.keymap.set("n", "<Leader>q", ":bd<CR>")
-- open previous buffer
vim.keymap.set("n", "<Leader>bn", ":bn<CR>")
vim.keymap.set("n", "<Leader>bp", ":bp<CR>")
vim.keymap.set("n", "<Leader>bd", ":bd<CR>")
vim.keymap.set("n", "<Leader>bb", ":b#<CR>")


-- Movement mgmt --------------------------------------------------------------
vim.keymap.set("n", "'", "`")
vim.keymap.set("n", "`", "'")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")
vim.keymap.set("n", "^", "0")
-- vim.keymap.set("n", "9", "$")
-- vim.keymap.set("n", "9", "$")
vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-b>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- Terminal mgmt --------------------------------------------------------------
-- vim.keymap.set("t", "<expr>", "<Esc> (&filetype == "fzf") ? "<Esc>-- : "<C-\><C-n>"")
-- Move to window
vim.keymap.set("t", "<c-j>", "<c-w>j")
vim.keymap.set("t", "<c-k>", "<c-w>k")
vim.keymap.set("t", "<c-h>", "<c-w>h")
vim.keymap.set("t", "<c-l>", "<c-w>l")


-- Text mgmt ------------------------------------------------------------------
vim.keymap.set({"o", "v"}, "q", "i\"")
vim.keymap.set({"o", "v"}, "'", "i'")
vim.keymap.set({"o", "v"}, "p", "i(")
vim.keymap.set({"o", "v"}, "f", "i{")
vim.keymap.set({"o", "v"}, "b", "i[")

vim.keymap.set("n", "Y", "y$")
-- Junta lineas sin mover cursor
vim.keymap.set("n", "J", "mzJ`z")
-- nnoremap <C-p> "0p
-- paste from yank
-- nnoremap <C-S-p> "0P
-- Inserta espacio y enter
vim.keymap.set("n", "<C-space>", "i <esc>")


-- Select mgmt ----------------------------------------------------------------
vim.keymap.set("v", "v", "V")
-- indentar sin perder la seleccion
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
-- Mueve lineas hacia arriba y abajo
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv")

--
-- Jump mgmt ----------------------------------------------------------------
vim.keymap.set("n", "[q", ":cp<CR>zz")
vim.keymap.set("n", "]q", ":cn<CR>zz")
vim.keymap.set("n", "[Q", ":cfirst<CR>zz")
vim.keymap.set("n", "]Q", ":clast<CR>zz")
vim.keymap.set("n", "<Leader>j", ":cnext<CR>zz")
vim.keymap.set("n", "<Leader>k", ":cprev<CR>zz")
-- Cierra ventana quickfix con ESC
--autocmd FileType qf nnoremap <buffer> <Esc> :cclose <bar> :lclose<CR>
--
-- Salta entre tags
vim.keymap.set("n", "[t", ":tprevious<CR>")
vim.keymap.set("n", "]t", ":tnext<CR>")
vim.keymap.set("n", "[l", ":lp<CR>")
vim.keymap.set("n", "]l", ":lnext<CR>")
vim.keymap.set("n", "[L", ":lfirst<CR>")
vim.keymap.set("n", "]L", ":llast<CR>")


-- --------------- Config Status Line ------------------------------------------
vim.keymap.set("n", "<Leader>cc", ":lua ColorMyPencils()<CR>")
