filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'zackhsi/fzf-tags'
" Plugin 'neoclide/coc.nvim'
Plugin 'yegappan/taglist.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mg979/vim-visual-multi'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'michaeljsmith/vim-indent-object'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
