filetype off

" set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin('~/.config/nvim/bundle')
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'bling/vim-airline'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'altercation/vim-colors-solarized'
" call vundle#end()

call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
call plug#end()

set backspace=2         " allow backspacing over everything in insert mode

set tabstop=2           " Each Tab has 1 spaces equivalent width
set shiftwidth=2        " Indentation width when using >> and << re-indentation
set nobackup
set expandtab           " Tabs are expanded to spaces
set showcmd
set showmatch
set showmode
set ruler
set noerrorbells
set modeline

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

filetype plugin on
filetype indent on
syntax on

set number

let mapleader="\<SPACE>"

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

set background=dark
colorscheme solarized

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
