filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'

Plugin 'guns/xterm-color-table.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'zackhsi/fzf-tags'

Plugin 'vim-scripts/taglist.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mg979/vim-visual-multi'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'arnaud-lb/vim-php-namespace'

Plugin 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php' }
Plugin 'ncm2/ncm2', {'for': 'php'}
Plugin 'roxma/nvim-yarp'
Plugin 'phpactor/ncm2-phpactor'
Plugin 'ncm2/ncm2-ultisnips'
Plugin 'SirVer/ultisnips'

" Plugin 'dense-analysis/ale'

Plugin 'easymotion/vim-easymotion'

Plugin 'itchyny/lightline.vim'

Plugin 'StanAngeloff/php.vim'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'

Plugin 'jacoborus/tender.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
