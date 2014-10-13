set autowrite
set diffopt+=iwhite
set nocompatible
filetype on
set nu
set paste
set nowrap
set ts=2
set bs=2
set shiftwidth=2
set smartindent
set expandtab
"set list



" Appearance
set background=dark
syntax enable
"colorscheme solarized


" Set up pathogen plugin
execute pathogen#infect()
syntax on
filetype plugin indent on


" Status Line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P
set laststatus=2
