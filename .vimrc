set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim
" luafile ~/.vim/lsp_config.lua

syntax on
syntax enable
set noerrorbells
set history=500
set updatetime=2000

set noswapfile
set nobackup

set backspace=indent,eol,start

set ttyfast
set autoread          " reload file if changed outside vim

set smartindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set breakindent
set showbreak=..
set textwidth=0
set foldmethod=indent
set foldlevel=99

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set tags=./tags,tags,tags.vendor,.git/tags;
set colorcolumn=100
set grepformat=%f:%l:%m

set path+=**
set wildmenu

set ruler
set number
set numberwidth=4
set relativenumber
set signcolumn=yes         " siempre mostrar signcolumns

set showcmd
set notitle
set laststatus=2
set noshowmode
set showtabline=1         " show tab line
set scrolloff=3
"set visualbell
set cursorline
set splitbelow splitright

"--------------- Search ---------------"
set ignorecase
set smartcase
set incsearch
set hlsearch



" ############################################################################
" Visuals
" ############################################################################
" colorscheme gruvbox
" colorscheme nord
" colorscheme tokyonight

" set translucent background
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

set guifont=Consolas:h11
set linespace=8
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

if !has('gui_running')
    set t_Co=256
endif

set background=dark
set termguicolors


" ############################################################################
" Keyboard Mappings
" ############################################################################
" Leader Key -----------------------------------------------------------------
" let mapleader=','
let mapleader=' '

" Mappings -------------------------------------------------------------------
"nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>ep :e ~/.vim/plugins.vim<CR>
nnoremap <Leader>et :e ~/.tmux.conf<CR>
"nnoremap <Leader><space> :nohls<CR>
nnoremap <silent><esc> :noh<CR>
nnoremap <silent><Leader>w :w<CR>
" noremap <silent><Leader>p :CtrlP<CR>
nnoremap <silent><Leader>f :tj <c-r><c-w><CR>
" nnoremap <silent><Leader>f :ltag <C-r><C-w><CR> <bar> :buffer #<CR> <bar> :lopen<CR>
nnoremap <silent><Leader>s :TlistToggle<CR>
nnoremap <silent><Leader>i :call PhpInsertUse()<CR>

nnoremap <Leader>h :tab help<space>
" Disable anoying ex mode
nnoremap Q <Nop>
"Exit VIM
" nnoremap <M-q> :q<CR>
"Las command
nnoremap <C-x> :<Up>


" Latam Keyboard mgmt --------------------------------------------------------
nnoremap ñ :
nnoremap ¿ /
nnoremap <f3> <c-]>


" US Keyboard mgmt -----------------------------------------------------------
nnoremap ; :
nnoremap : ;


" Windows mgmt ---------------------------------------------------------------
" Vertical Split
nnoremap <Leader>vs :vsp<CR>
" Horizontal Split
nnoremap <Leader>sp :sp<CR>
" Maximizes window
nnoremap <silent><Leader>m :only<CR>
" Close the window
nnoremap <silent><Leader>c :close<CR>
" Move to window
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Resize window
nnoremap <silent><M-Up> :resize +5<CR>
nnoremap <silent><M-Down> :resize -5<CR>
nnoremap <silent><M-Left> :vertical resize +5<CR>
nnoremap <silent><M-Right> :vertical resize -5<CR>


" Buffer related -------------------------------------------------------------
nnoremap <f5> :buffers<CR>:buffer<space>
nnoremap <silent><c-s-tab> :bp<CR>
nnoremap <silent><c-tab> :bn<CR>
nnoremap <silent>[b :bp<CR>
nnoremap <silent>]b :bn<CR>
nnoremap <silent><Leader><s-tab> :bp<CR>
nnoremap <silent><Leader><tab> :bn<CR>
nnoremap <silent><S-l> :bn<CR>
nnoremap <silent><S-h> :bp<CR>
nnoremap <tab> :b<space>
nnoremap <silent><Leader>q :bd<CR>
"open previous buffer
nnoremap <silent><Leader>bn :bn<CR>
nnoremap <silent><Leader>bp :bp<CR>
nnoremap <silent><Leader>bd :bd<CR>
nnoremap <silent><Leader>bb :b#<CR>


" Movement mgmt --------------------------------------------------------------
nnoremap ' `
nnoremap ` '
inoremap jj <Esc>
noremap j gj
noremap k gk
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz
nnoremap 0 ^
vnoremap 0 ^
nnoremap ^ 0
vnoremap ^ 0
nnoremap 9 $
vnoremap 9 $
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz


" Terminal mgmt --------------------------------------------------------------
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-n>"
" Move to window
tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
tnoremap <c-h> <c-w>h
tnoremap <c-l> <c-w>l


" Text mgmt ------------------------------------------------------------------
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
nnoremap Y y$
"Mueve lineas hacia arriba y abajo
nnoremap J mzJ`z
" nnoremap <C-p> "0p
" paste from yank
" nnoremap <C-S-p> "0P
" Inserta espacio y enter
nnoremap <C-space> i <esc>

" Select mgmt ----------------------------------------------------------------
vnoremap v V
" indentar sin perder la seleccion
vnoremap > >gv
vnoremap < <gv
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" Jump mgmt ----------------------------------------------------------------
nnoremap <silent>[q :cp<CR>zz
nnoremap <silent>]q :cn<CR>zz
nnoremap <silent>[Q :cfirst<CR>zz
nnoremap <silent>]Q :clast<CR>zz
nnoremap <silent> <Leader>j :cnext<CR>zz
nnoremap <silent> <Leader>k :cprev<CR>zz
"Cierra ventana quickfix con ESC
autocmd FileType qf nnoremap <buffer><silent> <Esc> :cclose <bar> :lclose<CR>
"Salta entre tags
nnoremap <silent>[t :tprevious<CR>
nnoremap <silent>]t :tnext<CR>
nnoremap <silent>[l :lp<CR>
nnoremap <silent>]l :lnext<CR>
nnoremap <silent>[L :lfirst<CR>
nnoremap <silent>]L :llast<CR>

"--------------- Auto-Commands -----------------------------------------------
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc      source %
    autocmd BufWritePost .vimrc      :call VimColors()
    autocmd BufWritePost plugins.vim source %
augroup END


"--------------- Config Status Line ------------------------------------------
nnoremap <Leader>cc :call VimColors()<CR>

let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \ },
    \ 'component_function': {
        \ 'gitbranch': 'FugitiveHead',
        \ 'listbuffers': 'ListBuffers',
        \ },
    \ 'mode_map': {
        \ 'n' : ' NORMAL ',
        \ 'i' : ' INSERT ',
        \ 'R' : ' REPLACE',
        \ 'v' : ' VISUAL ',
        \ 'V' : ' V-LINE ',
        \ "\<C-v>": ' V-BLOCK',
        \ 'c' : ' COMMAND',
        \ 's' : ' SELECT ',
        \ 'S' : ' S-LINE ',
        \ "\<C-s>": ' S-BLOCK',
        \ 't': ' TERMINAL',
        \ }
    \ }

"set statusline=
"set statusline+=%#Search#%{(NewMode()=='n')?'\ \ \ \ NORMAL\ \ \ ':''}
"set statusline+=%#DiffAdd#%{(NewMode()=='i')?'\ \ \ \ INSERT\ \ \ ':''}
"set statusline+=%#ErrorMsg#%{(NewMode()=='r')?'\ \ \ \ REPLACE\ \ ':''}
"set statusline+=%#DiffChange#%{(NewMode()=='V')?'\ \ \ \ VISUAL\ \ \ ':''}
"set statusline+=%#DiffChange#%{(NewMode()=='<c-v>')?'\ \ \ \ VISUAL\ \ \ ':''}
"set statusline+=%#Cursor#%{(NewMode()=='c')?'\ \ \ \ COMMAND\ \ ':''}
"set statusline+=%#Statusline#
"set statusline+=\ [%n]       " buffer number
"set statusline+=%m           " flag modificacion del archivo
"set statusline+=%r           " flag readonly file
"set statusline+=%h           " help buffer flag
"set statusline+=\ %F         " path y nombre del archivo
"set statusline+=\ %t\         " solo nombre del archivo
"set statusline+=\ %{StatuslineGit()}
"set statusline+=\ %=         " separation point
"set statusline+=\ %Y\ \|        " file type
"set statusline+=\ %{&fileencoding?&fileencondig:&encoding}\ \|    " file encoding
"set statusline+=\ %{ShowFileFormatFlag(&fileformat)}\             " file format
"set statusline+=\ %{NewMode()}            " file format
"set statusline+=\ %#Search#\ %3p%%      " % de linea respecto del total
"set statusline+=\ %#Cursor#
"set statusline+=\ %3l/%L            " Numero de linea actual / numero de lineas totales
"set statusline+=\ :\ %-2c%V        " Numero de la columna
"set statusline+=\ \ %3l:%-2c\ \             " Numero de linea actual / numero de lineas totales


" Elimina ultimos espacios de las lineas al grabar -------------------------
autocmd BufWritePre * %s/\s\+$//e


" ############################################################################
" Plugin Settings
" ############################################################################

" Telescope ------------------------------------------------------------------
nnoremap <silent><C-p> :Telescope git_files<CR>
nnoremap <silent><Leader>p :Telescope find_files<CR>
nnoremap <silent><Leader>P :Telescope git_files<CR>
nnoremap <silent><Leader>o :Telescope commands<CR>
nnoremap <silent><Leader>hh :Telescope help_tags<CR>


" FZF y FZF Tags --------------------------------------------------------------
" nnoremap <silent><C-p> :GFiles<CR>
" nnoremap <silent><Leader>p :Files<CR>
" nnoremap <silent><Leader>P :GFiles<CR>
" nnoremap <silent><Leader>o :Commands<CR>
" nnoremap <silent><Leader>f :Tags <c-r><c-w><CR>
" nnoremap <silent><Leader>hh :Helptags<CR>
" nnoremap <silent><Leader>r :Ag <c-r><c-w><CR>

"let g:fzf_tags_prompt = 'Gd '
let g:fzf_colors = {
\    'border': ['fg', 'Question'],
\}
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'yoffset': 0.1 } }
let g:fzf_layout = { 'down': '40%' }
let $FZF_DEFAULT_OPTS="--ansi --inline-info --preview-window 'right:65%' --preview 'batcat --style=header,grid'"

" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--preview']}, <bang>0)


" NerdTree -----------------------------------------------------------------
nnoremap <silent><Leader>d :NERDTreeToggle<CR>
nnoremap <silent><C-1> :NERDTreeToggle<CR>

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
"nnoremap <c-1> :NERDTreeToggle<CR>
" Open NERDTree when VIM starts with no arguments
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


" GitGutter ----------------------------------------------------------------
highlight def link GitGutterAddLineNr GitGutterAddLine
highlight def link GitGutterChangeLineNr GitGutterChangeLine
highlight def link GitGutterDeleteLineNr GitGutterDeleteLine
highlight def link GitGutterChangeDeleteLineNr GitGutterChangeDeleteLine
"let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

nnoremap <Leader>gp :GitGutterPrevHunk<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap [g :GitGutterPrevHunk<CR>
nnoremap ]g :GitGutterNextHunk<CR>
nnoremap <Leader>gv :GitGutterPreviewHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>

" actualiza gitgutter al grabar
augroup GitGutterConfig
    autocmd!
    autocmd BufWritePost * GitGutter
augroup END


" fugitive ----------------------------------------------------------------
nnoremap <Leader>g :Git<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gc :Git commit<CR>


" TreeSitter -----------------------------------------------------------------
lua <<EOL
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "help", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOL


" LSP Zero -----------------------------------------------------------------
lua <<EOL
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
EOL


" VisualMulti ----------------------------------------------------------------
let g:VM_maps = {}
" let g:VM_maps['Find Under'] = '<C-d>'
" let g:VM_maps['Find Subword Under'] = '<C-d>'


" Snipmate -----------------------------------------------------------------
let g:snipMate = { 'snippet_version' : 1 }


" TList --------------------------------------------------------------------
let Tlist_Close_On_Select = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let tlist_php_settings = 'php;f:function'


" PHP Namespace ---------------------------------------------------------------
let g:php_namespace_sort_after_insert = 1


"PHPdocumentor ---------------------------------------------------------------
let g:pdv_template_dir = "~/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <Leader>t :call pdv#DocumentWithSnip()<CR>


" Phpactor -------------------------------------------------------------------
"autocmd Filetype php setlocal omnifunc=phpactor#Complete
" nnoremap <silent><Leader>mm :call phpactor#ContextMenu()<CR>
" nnoremap <silent><Leader>nn :call phpactor#Navigate()<CR>


" Autocomplete ----------------------------------------------------------------
" augroup ncm2
"     au!
"     autocmd BufEnter * call ncm2#enable_for_buffer()
"     au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
"     au User Ncm2PopupClose set completeopt=menuone
" augroup END

" inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", "n") : "\<CR>")
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> <leader>lf <cmd>lua vim.lsp.buf.format()<CR>

" inoremap <expr> <C-space> pumvisible() ? "\<C-y>": "\<C-x>\<C-o>"
" inoremap <C-space> <Cmd>lua vim.lsp.buf.completion()<CR>
let g:jedi#popup_select_first = 1

set completeopt=menuone,longest
set shortmess+=c
" let g:completion_enable_auto_popup = 1
" let g:completion_enable_auto_signature = 0
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
" let g:completion_trigger_character = ['.', '::']

" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" VIM Commentary -------------------------------------------------------------
augroup focustoggle
  autocmd!
  autocmd BufEnter,FocusGained * setlocal cursorline
  autocmd BufLeave,FocusLost   * setlocal nocursorline
augroup END


command! Phpcs execute PHPCsLinter()
command! Phpstan execute PHPStan()


"Grep
set grepprg=grep\ -n\ -R\ --exclude-dir=storage\ --exclude-dir=.git\ --exclude=tags\ --exclude=tags.vendor\ --include=*.php
command! -nargs=+ Grep execute 'silent grep! <args>' | copen


" ############################################################################
" File specific settings
" ############################################################################

" PHP ------------------------------------------------------------------------
autocmd Filetype php inoremap $$ $this->

autocmd Filetype php set commentstring=//%s
"
"csv error format    NOT WORKING!!!!
autocmd Filetype php set errorformat+="%f"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,"%m"\\,%*[a-zA-Z0-9_.-]\\,%*[0-9]\\,%*[0-9]
"emacs error format   OK!
autocmd Filetype php set errorformat+=%f:%l:%c:\ %m

autocmd Filetype php nnoremap <silent> <Leader>l :call PHPCsLinterFile()<CR>
autocmd Filetype php nnoremap <silent> <Leader>L :call PHPCsLinterAll()<CR>


" Python ---------------------------------------------------------------------

autocmd Filetype python set makeprg=pylint\ --reports=n\ --score=n\ %:p
autocmd Filetype python set errorformat=%f:%l:%c:\ %t%n:\ %m,%f:%l:\ %t%*[a-z]:\ %m,%-G%.%#

autocmd Filetype python nnoremap <silent> <Leader>l :call PythonLint()<CR>
autocmd Filetype python nnoremap <silent> <Leader>L :call PythonLint2()<CR>



" ############################################################################
" Functions
" ############################################################################

function! ShowFileFormatFlag(var)
    if (a:var == 'dos')
        return 'dos'
    elseif (a:var=='mac')
        return 'mac'
    else
        return 'unix'
    endif
endfunction


function! NewMode()
    if ( mode() == "\<c-v>")
        return 'v'
    else
        return mode()
endfunction


function! GitBranch()
    return system('git rev-parse --abbrev-ref HEAD | tr -d "\n"')
endfunction


function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname>0)?' (git:'.l:branchname.')':''
endfunction


function! ListBuffers()
    return "[".join(map(filter(getbufinfo({'buflisted':1}), {key, val -> val.bufnr != buffer_number()}), {key, val -> fnamemodify(val.name, ":t")}), " • ")."]"
endfunction


function! PHPCsLinterFile()
    let l:filename=@%
    let l:phpcs_output=system('phpcs -q --report=emacs '.l:filename)
    " echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    " unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    copen 5
endfunction


function! PHPCsLinterAll()
    let l:phpcs_output=system('phpcs -q --report=emacs')
    " echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    " unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    copen 5
endfunction


function! PHPStan()
    let l:filename=@%
    let l:php_output=system('./vendor/bin/phpstan --no-progress --error-format=raw analyse')
    " echo l:php_output
    let l:php_list=split(l:php_output, "\n")
    unlet l:php_list[0]
    cexpr l:php_list
    copen 5
endfunction


function! PythonLint()
    let l:filename=@%
    let l:python_output=system('pylint --reports=n --score=n '.l:filename)
    let l:python_list=split(l:python_output, "\n")
    unlet l:python_list[0]
    cexpr l:python_list
    copen 5
endfunction


function! PythonLint2()
    let l:filename=@%
    let l:python_output=system('mypy --strict '.l:filename)
    let l:python_list=split(l:python_output, "\n")
    unlet l:python_list[0]
    cexpr l:python_list
    copen 5
endfunction

function! VimColors()
    colorscheme nord
    highlight Normal guibg=none ctermbg=none
    highlight NormalFloat guibg=none ctermbg=none
endfunction

call VimColors()
