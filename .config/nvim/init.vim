call plug#begin('~/.config/nvim/bundle')

Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'beardedfoo/vim-colemak'
Plug 'scrooloose/nerdcommenter'
call plug#end()

set noshowmode
set termguicolors
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set autoindent
set smarttab
set mouse=a
set number relativenumber
filetype plugin on
