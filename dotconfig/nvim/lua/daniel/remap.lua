local keymap = vim.keymap

keymap.set("x", "<leader>p", "\"_dP")


-- ############################################################################
-- Keyboard Mappings from .vimrc
-- ############################################################################

keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- keymap.set("n", "<Leader>ev", ":e ~/.config/nvim/<CR>")
keymap.set("n", "<Leader>ep", ":e ~/.vim/plugins.vim<CR>")
keymap.set("n", "<Leader>et", ":e ~/.tmux.conf<CR>")
keymap.set("n", "<esc>", ":noh<CR>", { silent = true })
keymap.set("n", "<Leader>w", ":w<CR>", { silent = true })
keymap.set("n", "<Leader>f", ":tj <c-r><c-w><CR>")
-- keymap.set("n", "<Leader>s", ":TlistToggle<CR>")
-- keymap.set("n", "<Leader>i", ":call PhpInsertUse()<CR>")

keymap.set("n", "<Leader>h", ":tab help<space>")
-- Disable anoying ex mode
keymap.set("n", "Q", "<nop>")
-- Last command
keymap.set("n", "<C-x>", ":<Up>")


-- Latam Keyboard mgmt --------------------------------------------------------
keymap.set("n", "ñ", ":")
keymap.set("n", "¿", "/")
keymap.set("n", "<f3>", "<c-]>")


-- US Keyboard mgmt -----------------------------------------------------------
keymap.set("n", ";", ":")
keymap.set("n", ":", ";")


-- Windows mgmt ---------------------------------------------------------------
-- Vertical Split
keymap.set("n", "<Leader>vs", ":vsp<CR>")
-- Horizontal Split
keymap.set("n", "<Leader>sp", ":sp<CR>")
-- Maximizes window
keymap.set("n", "<Leader>m", ":only<CR>")
-- Close the window
keymap.set("n", "<Leader>c", ":close<CR>")
-- Move to window
keymap.set("n", "<c-j>", "<c-w>j", { silent=true })
keymap.set("n", "<c-k>", "<c-w>k", { silent=true })
keymap.set("n", "<c-h>", "<c-w>h", { silent=true })
keymap.set("n", "<c-l>", "<c-w>l", { silent=true })
-- Resize window
keymap.set("n", "<M-Up>", ":resize +5<CR>")
keymap.set("n", "<M-Down>", ":resize -5<CR>")
keymap.set("n", "<M-Left>", ":vertical resize +5<CR>")
keymap.set("n", "<M-Right>", ":vertical resize -5<CR>")


-- Buffer related -------------------------------------------------------------
keymap.set("n", "<f5>", ":buffers<CR>:buffer<space>")
keymap.set("n", "<c-s-tab>", ":bp<CR>")
keymap.set("n", "<c-tab>", ":bn<CR>")
keymap.set("n", "[b", ":bp<CR>")
keymap.set("n", "]b", ":bn<CR>")
keymap.set("n", "<Leader><s-tab>", ":bp<CR>")
keymap.set("n", "<Leader><tab>", ":bn<CR>")
keymap.set("n", "<S-l>", ":bn<CR>")
keymap.set("n", "<S-h>", ":bp<CR>")
-- keymap.set("n", "<tab>", ":b<space>")
keymap.set("n", "<Leader>q", ":bd<CR>")
-- open previous buffer
keymap.set("n", "<Leader>bn", ":bn<CR>")
keymap.set("n", "<Leader>bp", ":bp<CR>")
keymap.set("n", "<Leader>bd", ":bd<CR>")
keymap.set("n", "<Leader>bb", ":b#<CR>")


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
keymap.set("n", "<c-f>", "<c-f>zz")
keymap.set("n", "<c-b>", "<c-b>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")


-- Terminal mgmt --------------------------------------------------------------
-- keymap.set("t", "<expr>", "<Esc> (&filetype == "fzf") ? "<Esc>-- : "<C-\><C-n>"")
-- Move to window
-- keymap.set("t", "<c-j>", "<c-w>j")
-- keymap.set("t", "<c-k>", "<c-w>k")
-- keymap.set("t", "<c-h>", "<c-w>h")
-- keymap.set("t", "<c-l>", "<c-w>l")


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
keymap.set("n", "<C-space>", "i <esc>")
keymap.set("n", "x", '"_x')


-- Select mgmt ----------------------------------------------------------------
keymap.set("v", "v", "V")
-- indentar sin perder la seleccion
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
-- Mueve lineas hacia arriba y abajo
keymap.set("v", "J", ":move '>+1<CR>gv=gv")
keymap.set("v", "K", ":move '<-2<CR>gv=gv")

--
-- Jump mgmt ----------------------------------------------------------------
keymap.set("n", "[[", "[[zz")
keymap.set("n", "]]", "]]zz")
keymap.set("n", "qf", ":copen<CR>")
keymap.set("n", "[q", ":cp<CR>zz")
keymap.set("n", "]q", ":cn<CR>zz")
keymap.set("n", "[Q", ":cfirst<CR>zz")
keymap.set("n", "]Q", ":clast<CR>zz")
keymap.set("n", "<Leader>j", ":cnext<CR>zz")
keymap.set("n", "[m", "[mzz")
keymap.set("n", "]m", "]mzz")
keymap.set("n", "[M", "[Mzz")
keymap.set("n", "]M", "]Mzz")
keymap.set("n", "<Leader>k", ":cprev<CR>zz")
-- Cierra ventana quickfix con ESC
-- autocmd FileType qf nnoremap <buffer> <Esc> :cclose <bar> :lclose<CR>
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "qf",
--     callback = function()
--         vim.keymap.set('n', '<esc>', ":cclose<CR>", { silent = true })
--     end
-- })
--
-- Salta entre tags
keymap.set("n", "[t", ":tprevious<CR>")
keymap.set("n", "]t", ":tnext<CR>")
keymap.set("n", "[l", ":lp<CR>zz")
keymap.set("n", "]l", ":lnext<CR>zz")
keymap.set("n", "[L", ":lfirst<CR>zz")
keymap.set("n", "]L", ":llast<CR>zz")


-- --------------- Config Status Line ------------------------------------------
keymap.set("n", "<Leader>cc", ":lua ColorMyPencils()<CR>")
