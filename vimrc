set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

set history=500
syntax on

set backspace=indent,eol,start
let mapleader=','

set ttyfast
set autoread          " reload file if changed outside vim
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set encoding=utf-8
set fileencoding=utf-8
"set fileformat=unix
set fileformats=unix,dos
set tags=./tags,tags,.git/tags;
set grepprg=C:\\util\\bin\\grep\ -n\ -R\ --exclude-dir=.git\ --include=*.php
set grepformat=%f:%l:%m

set path+=**
set wildmenu

set ruler
set showcmd
set notitle
set laststatus=2
"set showtabline=2


"--------------- Visuals ---------------"
set guifont=Consolas:h11
set linespace=8
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set cursorline
"colorscheme atom
colorscheme hybrid_material

set t_Co=256
set background=dark
set termguicolors
"highlight CursorLine term=none cterm=none ctermbg=232
"highlight CursorLineNr ctermfg=15 ctermbg=4
"highlight LineNr ctermfg=8
"highlight Normal term=none cterm=none ctermbg=0
"highlight Normal term=none cterm=none ctermbg=21
"highlight Visual ctermbg=5
"highlight StatusLineNC cterm=none ctermbg=2
"highlight User1 ctermfg=250 ctermbg=237 guifg=#c5c8c6 guibg=#455a64
"highlight User2 ctermfg=250 ctermbg=237 guifg=#c5c8c6 guibg=#455a64

set number
set numberwidth=5
set relativenumber


"--------------- Search ---------------"
set ignorecase
set incsearch
set hlsearch


"--------------- Mappings ---------------"
"nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>ev :e ~/.vimrc<cr>
nmap <Leader><space> :nohlsearch<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader>vs :vsp<cr>
noremap <Leader>sp :sp<cr>
noremap <silent><Leader>p :CtrlP<cr>
noremap <silent><Leader>o :CtrlPTag<cr>
noremap <Leader>f :tj <c-r><c-w><cr>

nnoremap ñ :
nnoremap ' `


" Windows mgmt ---------------------
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>

" Movement mgmt ---------------------
inoremap jj <Esc>
noremap j gj
noremap k gk
nnoremap ¿ /
nnoremap { {zz
nnoremap } }zz
nnoremap 0 ^
vnoremap 0 ^
nnoremap ^ 0
vnoremap ^ 0
nnoremap 9 $
vnoremap 9 $


" Text mgmt ---------------------
onoremap q i"
vnoremap q i"
onoremap ' i'
vnoremap ' i'
onoremap p i(
vnoremap p i(
onoremap f i{
vnoremap f i{
onoremap b i[
vnoremap b i[

" Select mgmt ---------------------
vnoremap v V

" Buffer related -----------------------
nnoremap <f5> :buffers<CR>:buffer<space>
nnoremap <c-tab> :bn<cr>
nnoremap <c-s-tab> :bp<cr>
nnoremap <Leader><tab> :bn<cr>
nnoremap <Leader><s-tab> :bp<cr>
nnoremap <tab> :b<space>
nnoremap <silent><Leader>q :bd<cr>

nnoremap <Leader>h :tab help<space>

"Make NERDTree easier to toggle -----------------------
nmap <silent><Leader>d :NERDTreeToggle<cr>
let g:NERDTreeMinimalUI = 1

nnoremap <f3> <c-]>


"--------------- Auto-Commands ---------------"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


set autoindent
set scrolloff=3
set visualbell


set statusline=
set statusline+=%#StatusLine#%{(mode()=='n')?'\ \ \ \ NORMAL\ \ \ ':''}
set statusline+=%#DiffAdd#%{(mode()=='i')?'\ \ \ \ INSERT\ \ \ ':''}
set statusline+=%#SpellBad#%{(mode()=='r')?'\ \ \ \ REPLACE\ \ ':''}
set statusline+=%#DiffChange#%{(mode()=='v')?'\ \ \ \ VISUAL\ \ \ ':''}
set statusline+=%#DiffChange#%{(mode()=='^v')?'\ \ \ \ VISUAL\ \ \ ':''}
set statusline+=%#Cursor#%{(mode()=='c')?'\ \ \ COMMAND\ \ \ ':''}
set statusline+=%#Statusline#
set statusline+=\ [%n]       " buffer number
set statusline+=%m           " flag modificacion del archivo
set statusline+=%r           " flag readonly file
set statusline+=%h           " help buffer flag
set statusline+=\ %F         " path y nombre del archivo
"set statusline+=\ %{StatuslineGit()}
set statusline+=\ %=         " separation point
set statusline+=\ [%Y]         " file type
set statusline+=\ [%{&fileencoding?&fileencondig:&encoding}]    " file encoding
set statusline+=\ %{ShowFileFormatFlag(&fileformat)}            " file format
set statusline+=\ %#Cursor#
set statusline+=\ %3l/%L            " Numero de linea actual / numero de lineas totales
"set statusline+=\ :\ %-2c%V        " Numero de la columna
set statusline+=\ (%3p%%)\          " % de linea respecto del total

" elimina ultimos espacios de las lineas al grabar
autocmd BufWritePre * %s/\s\+$//e

" default the statusline to green when entering Vim
set noshowmode
set shiftwidth=4


" GitGutter ----------------------------------------------------------------
highlight SignColumn guibg=none
highlight def link GitGutterAddLineNr GitGutterAddLine
highlight def link GitGutterChangeLineNr GitGutterChangeLine
highlight def link GitGutterDeleteLineNr GitGutterDeleteLine
highlight def link GitGutterChangeDeleteLineNr GitGutterChangeDeleteLine
"let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1
autocmd BufWritePost * GitGutter


" Functions ----------------------------------------------------------------

function! ShowFileFormatFlag(var)
    if (a:var == 'dos')
        return '[dos]'
    elseif (a:var=='mac')
        return '[mac]'
    else
        return '[unix]'
    endif
endfunction

function! GitBranch()
    return system('git rev-parse --abbrev-ref HEAD | c:\util\bin\tr -d "\n"')
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname>0)?' (git:'.l:branchname.')':''
endfunction


