set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" git integration
Plugin 'tpope/vim-fugitive'

" dutyl dlang
Plugin 'idanarye/vim-dutyl'

" vim-go plugin for do development
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


set autowrite
set diffopt+=iwhite
set nocompatible
set nu
set paste
set nowrap
set ts=2
set bs=2
set shiftwidth=2
set smartindent
set expandtab
set background=dark

syntax enable

" Status Line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P
set laststatus=2

" datyl
let g:dutyl_stdImportPaths=['/usr/local/Cellar/dmd/2.071.0_1/include/dlang/dmd']
