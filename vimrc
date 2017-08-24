set nocompatible        " Use gVim defaults

" set tw=80             " tw to specify a default text width
set fo=tcrq             " fo to specify default formatoptions
                        " t auto-wraps text using textwidth
                        " c auto-wraps comments using textwidth
                        " r auto-inserts the current comment leader
                        " q allows formatting of comments

set guioptions-=T       " Remove toolbar

set backspace=2         " Allow backspacing over everything in insert mode

set tabstop=2           " Each Tab has 1 spaces equivalent width
set softtabstop=2       " Visual space when editing
set expandtab           " Tabs are expanded to spaces
set shiftwidth=2        " Indentation width when using >> and << re-indentation

set nobackup

set hlsearch            " highlight the search
set incsearch           " search as characters are entered

set ls=2                " show a status line even if there's only one window

set number              " Display line numbers

set showcmd             " show command in bottom bar

set mousehide           " Hide the mouse when typing text

set cursorline          " Highlight current line

set autowrite           " Save buffer before switching buffers

set showmatch           " highlight matching [{()}]

filetype plugin on
filetype indent on

" set wildchar=<Tab> wildmenu wildmode=full  " Show menu on TAB in command line
set wildmenu

autocmd BufEnter * silent! lcd %:p:h  " set curretn dir on buffer entry

" source $VIMRUNTIME/vimrc_example.vim
syntax enable
set background=dark
colorscheme material-theme
""set background=light
""colorscheme material-theme-light
