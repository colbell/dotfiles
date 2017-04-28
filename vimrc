set nocompatible        " Use gVim defaults

" set tw=80             " tw to specify a default text width
set fo=tcrq             " fo to specify default formatoptions
                        " t auto-wraps text using textwidth
                        " c auto-wraps comments using textwidth
                        " r auto-inserts the current comment leader
                        " q allows formatting of comments

set guioptions-=T       " Remove toolbar

set backspace=2         " Allow backspacing over everything in insert mode

set tabstop=1           " Each Tab has 1 spaces equivalent width
set shiftwidth=2        " Indentation width when using >> and << re-indentation
set nobackup
set expandtab           " Tabs are expanded to spaces

set hlsearch            " highlight the search
set ls=2                " show a status line even if there's only one window

set number              " Display line numbers

set mousehide           " Hide the mouse when typing text

set autowrite           " Save buffer before switching buffers

filetype plugin on
filetype indent on

set wildchar=<Tab> wildmenu wildmode=full  " Show menu on TAB in command line

" source $VIMRUNTIME/vimrc_example.vim
