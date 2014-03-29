call pathogen#infect()

filetype on
filetype plugin on
filetype indent on

syntax on

set wildmenu
set nocompatible
set number
set vb
set ruler
set number
set guioptions=ac
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

let mapleader = ","
let maplocalleader = "\\"

color darkbone

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" delete line
inoremap <c-d> <esc>ddi

" upcase word
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU


"""""""""""""""
" Experimenting
inoremap jk <esc>
inoremap <esc> <nop>
"""""""""""""""

cnoremap <c-a> <home>
cnoremap <c-f> <right>
cnoremap <esc>f <s-right>
cnoremap <c-b> <left>
cnoremap <esc>b <s-left>
cnoremap <c-k> d<end>

noremap <leader>n :cn<CR>
noremap <leader>p :cp<CR>

noremap <leader>dt :NERDTreeToggle<CR>
noremap <leader>df :NERDTreeFind<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1

let g:CommandTMaxFiles=40000
noremap <leader>t :CommandTFlush<CR>:CommandT<CR>

let g:paredit_matchlines=1000

let vimclojure#FuzzyIndent=1
let vimclojure#ParenRainbow=1

augroup no_whitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup filetype_clojure
  autocmd!
  autocmd BufNewFile,BufRead *.hiccup set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs set filetype=clojure
  autocmd BufNewFile,BufRead *.edn set filetype=clojure
  autocmd BufNewFile,BufRead *.cljx set filetype=clojure
  autocmd FileType clojure setlocal lispwords+=describe,it,context,around
  autocmd FileType clojure setlocal wildignore+=target/**/*
  autocmd FileType clojure vnoremap <buffer> <localleader>ns :s/\(\w\) \{2,}/\1 /<esc>
augroup END

augroup comments
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
  autocmd FileType ruby nnoremap <buffer> <localleader>c I# <esc>
  autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
  autocmd FileType clojure nnoremap <buffer> <localleader>c I; <esc>
augroup END

augroup filetype_pml
  autocmd!
  autocmd FileType pml iabbrev <buffer> -mdash- —
  autocmd FileType pml iabbrev <buffer> -ndash- –
augroup END

nnoremap <silent> <leader>rr :1,$retab<CR>
nnoremap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>
nnoremap <silent> <leader>q :set invpaste<CR>:set paste?<CR>

nnoremap - <c-w>-
nnoremap + <c-w>+
noremap <silent> <leader>h :wincmd h<cr>
noremap <silent> <leader>j :wincmd j<cr>
noremap <silent> <leader>k :wincmd k<cr>
noremap <silent> <leader>l :wincmd l<cr>
noremap <silent> <C-h> :wincmd h<cr>
noremap <silent> <C-j> :wincmd j<cr>
noremap <silent> <C-k> :wincmd k<cr>
noremap <silent> <C-l> :wincmd l<cr>
noremap <silent> <leader>cc :close<cr>

noremap <LocalLeader>t :!ctags -R --langmap="lisp:+.clj" .<CR>
nnoremap <Leader>rt :!ctags -R *<CR>

noremap <Leader>rb :call VimuxRunCommand("bundle exec rspec " . bufname("%"))<CR>
noremap <Leader>rp :VimuxPromptCommand<CR>
noremap <Leader>rl :VimuxRunLastCommand<CR>
noremap <Leader>ri :VimuxInspectRunner<CR>
noremap <Leader>rx :VimuxClosePanes<CR>
noremap <Leader>rq :VimuxCloseRunner<CR>
noremap <Leader>rs :VimuxInterruptRunner<CR>
noremap <LocalLeader>vp :VimuxPromptCommand<CR>
vnoremap <LocalLeader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
nnoremap <LocalLeader>vf ggVG<LocalLeader>vs<CR><C-o><C-o>
nnoremap <LocalLeader>vs vip<LocalLeader>vs<CR>
nnoremap <LocalLeader>vl V<LocalLeader>vs<CR>k

inoremap <C-j> <Plug>snipMateNextOrTrigger

" ex mode bites
nnoremap Q <nop>

if &term == 'xterm' || &term == 'screen'
  set t_Co=256
endif
