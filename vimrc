set nocompatible        " Use gVim defaults

" set tw=80             " tw to specify a default text width
set fo=tcrq             " fo to specify default formatoptions
                        " t auto-wraps text using textwidth
                        " c auto-wraps comments using textwidth
                        " r auto-inserts the current comment leader
                        " q allows formatting of comments


set backspace=2         " allow backspacing over everything in insert mode

set tabstop=1           " Each Tab has 1 spaces equivalent width
set shiftwidth=2        " Indentation width when using >> and << re-indentation
set nobackup
set expandtab           " Tabs are expanded to spaces

syntax on
filetype on

set number

source $VIMRUNTIME/vimrc_example.vim
