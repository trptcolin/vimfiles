call pathogen#infect()

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
"filetype off

set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on

" set lazyredraw

" completion on the command line
set wildmenu
" numbered lines
set number
" set nohlsearch
" set paste
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

map <leader>dt :execute 'NERDTreeToggle ' . '"' . getcwd() . '"'<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1

let g:CommandTMaxFiles=40000

let g:paredit_matchlines=1000

let vimclojure#FuzzyIndent=1
let vimclojure#ParenRainbow=1
autocmd FileType clojure setlocal lispwords+=describe,it,context

au BufNewFile,BufRead *.hiccup set filetype=clojure
au BufNewFile,BufRead *.cljs set filetype=clojure

"set textwidth=81
" >80 chars BAD
"match ErrorMsg '\%>80v.\+'
" >80 chars kind of bad
"set cc=+1
"hi ColorColumn ctermbg=green guibg=green

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

color darkbone

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

map <LocalLeader>t :!ctags -R --langmap="lisp:+.clj" .<CR>

" blow away trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

map <LocalLeader>sy :autocmd BufWritePre * :%s/\s\+$//e<CR>
map <LocalLeader>sn :autocmd! BufWritePre *<CR>
map <LocalLeader>sl :autocmd BufWritePre *<CR>


" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("bundle exec rspec " . bufname("%"))<CR>
" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>rl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>ri :VimuxInspectRunner<CR>
" Close all other tmux panes in current window
map <Leader>rx :VimuxClosePanes<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>rq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>rs :VimuxInterruptRunner<CR>

" Prompt for a command to run
map <LocalLeader>vp :VimuxPromptCommand<CR>
" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <LocalLeader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
" Select current file and send it to tmux
nmap <LocalLeader>vf ggVG<LocalLeader>vs<CR><C-o><C-o>
" Select current paragraph and send it to tmux
nmap <LocalLeader>vs vip<LocalLeader>vs<CR>
" Select current line and send it to tmux
nmap <LocalLeader>vl V<LocalLeader>vs<CR>k


" Let's remember some things, like where the .vim folder is.
"if has("win32") || has("win64")
"    let windows=1
"    let vimfiles=$HOME . "/vimfiles"
"    let sep=";"
"else
"    let windows=0
"    let vimfiles=$HOME . "/.vim"
"    let sep=":"
"endif

if &term == 'xterm' || &term == 'screen'
  set t_Co=256
endif

