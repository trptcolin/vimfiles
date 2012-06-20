runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off

set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on

" blow away trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" set lazyredraw

" completion on the command line
set wildmenu
" numbered lines
set number
" set nohlsearch
set paste
" " word wrapping
" set nowrap
" no beeps
set vb

" show line / column numbers
set ruler

" no goofy buttons
set guioptions=ac

let mapleader = ","

set tabstop=2
" set smarttab
set shiftwidth=2
set autoindent
set expandtab
" set backspace=start,indent
"
" set incsearch
"
" " I'm so nice to Windoze
" set shellslash
"
" set statusline=%F%m%r%h%w\ [Line=%03l,Col=%03v][%p%%]\ [ASCII=\%03.3b]\ [Format=%{&ff}]\ [Type=%y]
" set laststatus=2
" map <C-L> ggVG=

map <leader>n :cn<CR>
map <leader>p :cp<CR>

map <leader>dt :execute 'NERDTreeToggle ' . getcwd()<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1

let g:CommandTMaxFiles=40000


" " Edit or load .vimrc
" nmap <silent> ,ev :e $MYVIMRC<CR>
" nmap <silent> ,sv :so $MYVIMRC<CR>
"
" Replace tabs with spaces
nmap <silent> ,rr :1,$retab<CR>

" " Toggle paste mode (indent weirdness)
" nmap <silent> ,p :set invpaste<CR>:set paste?<CR>
" " Toggle highlighted search
" nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" Toggle word wrapping
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" " cd to directory of the current file
" nmap <silent> ,cd :lcd %:h<CR>

" set grepprg=ack
" set grepformat=%f:%l:%m

color vividchalk

" Move the cursor to the window in the proper direction
noremap <silent> <leader>h :wincmd h<cr>
noremap <silent> <leader>j :wincmd j<cr>
noremap <silent> <leader>k :wincmd k<cr>
noremap <silent> <leader>l :wincmd l<cr>
noremap <silent> <C-h> :wincmd h<cr>
noremap <silent> <C-j> :wincmd j<cr>
noremap <silent> <C-k> :wincmd k<cr>
noremap <silent> <C-l> :wincmd l<cr>

" Close the current window
noremap <silent> ,cc :close<cr>

" Prompt for a command to run
map <LocalLeader>vp :PromptVimTmuxCommand<CR>

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <LocalLeader>vs "vy :call RunVimTmuxCommand(@v)<CR>

" Select current paragraph and send it to tmux
nmap <LocalLeader>vs vip<LocalLeader>vs<CR>


" Let's remember some things, like where the .vim folder is.
if has("win32") || has("win64")
    let windows=1
    let vimfiles=$HOME . "/vimfiles"
    let sep=";"
else
    let windows=0
    let vimfiles=$HOME . "/.vim"
    let sep=":"
endif

