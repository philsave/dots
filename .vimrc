"
" ~/.vimrc
"

set nocompatible

" set line numbers
set number
set relativenumber

filetype plugin indent on

" use spaces instead of tabs
set expandtab

set shiftwidth=4
set tabstop=4
set smartindent
set autoindent

set belloff=all

" Syntax highlighting
syntax on

" Horizontal cursor line
set cursorline

set showmode

" Split window to open a pane in the bottom.
set splitbelow

" Split window to open a pane to the right.
set splitright

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Highlight search results
set hlsearch

" Search similar to modern browsers
set incsearch

" Set built-in colorscheme
colorscheme habamax
set background=dark


" STATUS LINE 

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %m\ %r\ %h\ %w\ Filetype:\ %y

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=[%l,%v]\ [%p%%]

" Show the status on the second to last line.
set laststatus=2

