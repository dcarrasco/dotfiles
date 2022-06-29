filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"
" Surround plugin
Plugin 'tpope/vim-surround'
" Git plugin
Plugin 'tpope/vim-fugitive'
" Commentary plugin
Plugin 'tpope/vim-commentary'
" Nerdtree
Plugin 'scrooloose/nerdtree'

" Agrega simbolos diferecias git en el gutter
Plugin 'airblade/vim-gitgutter'
" FZF para vim
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Usa FZF en tags, combina :tags con :tselect
Plugin 'zackhsi/fzf-tags'

" Muestra la estructura del archivo
Plugin 'vim-scripts/taglist.vim'
" Inserta y borra el par de parentesis, brackets, curly braces
Plugin 'jiangmiao/auto-pairs'
" Agrega multiples cursores (verticales)
Plugin 'mg979/vim-visual-multi'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'arnaud-lb/vim-php-namespace'

" Muestra los mappings de la leader key
Plugin 'liuchengxu/vim-which-key'

" Plugin 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php' }
" Plugin 'ncm2/ncm2', {'for': 'php'}
" Plugin 'roxma/nvim-yarp'
" Plugin 'phpactor/ncm2-phpactor'
" Plugin 'ncm2/ncm2-ultisnips'
" Plugin 'SirVer/ultisnips'

" Plugin 'dense-analysis/ale'

" Simpler way to use some motions (w, b, j, k, f, s)
Plugin 'easymotion/vim-easymotion'

" Statusline
Plugin 'itchyny/lightline.vim'

" Editor config properties
Plugin 'editorconfig/editorconfig-vim'

" PHP syntax
Plugin 'StanAngeloff/php.vim'

" Generate PHP Docblocks
Plugin 'tobyS/pdv'

" Telescope
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'davidhalter/jedi-vim'
" Plugin 'nvim-lua/completion-nvim'
" Plugin 'williamboman/nvim-lsp-installer'
" Plugin 'neoclide/coc.nvim'
" Plugin 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
