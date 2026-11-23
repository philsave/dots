" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Show line numbers
set number relativenumber

" Set colorscheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" curl -o one.vim https://raw.githubusercontent.com/rakr/vim-one/master/colors/one.vim
colorscheme molokai

" Enable filetype plugins
filetype plugin indent on

" Turn syntax highlighting on.
syntax on

" Enable mouse support
set mouse=a

" Encoding
set encoding=utf-8

" Sets default clipboard to the system clipboard
set clipboard=unnamedplus

" Use space characters instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Do not save backup files.
set nobackup

" Enable automatic indentation
set smartindent

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines
set nowrap

" Horizontal cursor line
set cursorline

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Split window to open a pane in the bottom.
set splitbelow

" Split window to open a pane to the right.
set splitright

" Enable auto completion menu after pressing TAB.
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Ignore capital letters during search
set ignorecase

" override the ignorecase option if searching for capital letters.
" this will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Disable annoying beep sound
set vb

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin()

  Plug 'preservim/nerdtree'
  
  Plug 'vimwiki/vimwiki'

call plug#end()

let g:vimwiki_list = [{'path': '~/Documents/Notes',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

let g:vimwiki_global_ext = 0

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set comma as the leader key.
let mapleader = ','

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Turn off search highlighting by pressing ,,
nnoremap <leader>, :nohlsearch<CR>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Center the cursor vertically when moving up/down half a page
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Open a new tab with CTRL+T.
nnoremap <silent> <C-t> :tabnew<CR>

" NERDTree specific mappings.
nnoremap <leader>n :NERDTreeToggle<CR>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Move lines above or below with ALT + [j/k].
" https://vimtricks.substack.com/p/vimtrick-moving-lines
nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" }}}

" STATUS LINE ------------------------------------------------------------ {{{  

set laststatus=2

set statusline=%F\ %h%w%m%r%=%y\ [%l:%c]\ %p%%

" }}}
