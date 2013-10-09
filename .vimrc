call pathogen#infect()

filetype on
filetype plugin on
filetype indent on

syntax on

set nocompatible
set wildmenu
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

color darkbone

map <leader>n :cn<CR>
map <leader>p :cp<CR>

map <leader>dt :execute 'NERDTreeToggle ' . '"' . getcwd() . '"'<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1

let g:CommandTMaxFiles=40000
map <leader>t :CommandTFlush<CR>:CommandT<CR>

let g:paredit_matchlines=1000

let vimclojure#FuzzyIndent=1
let vimclojure#ParenRainbow=1

autocmd FileType clojure setlocal lispwords+=describe,it,context,around
autocmd FileType clojure setlocal wildignore+=target/**/*

au BufNewFile,BufRead *.hiccup set filetype=clojure
au BufNewFile,BufRead *.cljs set filetype=clojure

nmap <silent> <leader>rr :1,$retab<CR>
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>
nmap <silent> <leader>q :set invpaste<CR>:set paste?<CR>

noremap <silent> <leader>h :wincmd h<cr>
noremap <silent> <leader>j :wincmd j<cr>
noremap <silent> <leader>k :wincmd k<cr>
noremap <silent> <leader>l :wincmd l<cr>
noremap <silent> <C-h> :wincmd h<cr>
noremap <silent> <C-j> :wincmd j<cr>
noremap <silent> <C-k> :wincmd k<cr>
noremap <silent> <C-l> :wincmd l<cr>
noremap <silent> <leader>cc :close<cr>

map <LocalLeader>t :!ctags -R --langmap="lisp:+.clj" .<CR>
nmap <Leader>rt :!ctags -R *<CR>

autocmd BufWritePre * :%s/\s\+$//e

map <LocalLeader>sy :autocmd BufWritePre * :%s/\s\+$//e<CR>
map <LocalLeader>sn :autocmd! BufWritePre *<CR>
map <LocalLeader>sl :autocmd BufWritePre *<CR>

map <Leader>rb :call VimuxRunCommand("bundle exec rspec " . bufname("%"))<CR>
map <Leader>rp :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rx :VimuxClosePanes<CR>
map <Leader>rq :VimuxCloseRunner<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <LocalLeader>vp :VimuxPromptCommand<CR>
vmap <LocalLeader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
nmap <LocalLeader>vf ggVG<LocalLeader>vs<CR><C-o><C-o>
nmap <LocalLeader>vs vip<LocalLeader>vs<CR>
nmap <LocalLeader>vl V<LocalLeader>vs<CR>k

" ex mode bites
nnoremap Q <nop>

if &term == 'xterm' || &term == 'screen'
  set t_Co=256
endif

