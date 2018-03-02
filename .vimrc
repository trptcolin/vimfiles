call pathogen#infect()

filetype on
filetype indent on

syntax on

set wildmenu
set nocompatible
set number
set vb
set ruler
set guioptions=ac
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set backspace=2

set breakindent

set incsearch

" allow arrow keys in insert mode
imap OA <ESC>ki
imap OB <ESC>ji
imap OC <ESC>li
imap OD <ESC>hi

setlocal foldlevelstart=0

" very magic (which somehow means normal regexes)
nnoremap / /\v

let mapleader = ","
let maplocalleader = "\\"

if &term == 'xterm' || &term == 'screen'
  set t_Co=256
endif

colorscheme darkbone

highlight LineTooLongMarker ctermfg=Black ctermbg=DarkGrey guifg=Black guibg=DarkGrey
call matchadd('LineTooLongMarker', '\%81v', 100)

nnoremap <leader>W :match Error /\v +$/<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" delete line
inoremap <c-d> <esc>ddi

" upcase word
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" Experimenting {{{
" inoremap <esc> <nop>
vnoremap <C-c> <Esc>
inoremap <C-[> <Esc>
" }}}

" Command line settings {{{
cnoremap <c-a> <home>
cnoremap <c-f> <right>
cnoremap <esc>f <s-right>
cnoremap <c-b> <left>
cnoremap <esc>b <s-left>
cnoremap <c-k> d<end>
" }}}

noremap <leader>n :cn<CR>
noremap <leader>p :cp<CR>

noremap <leader>dt :NERDTreeToggle<CR>
noremap <leader>df :NERDTreeFind<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1

let ctrlp_map = '<leader>t'
nmap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files -ocm --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:paredit_matchlines=1000

let vimclojure#FuzzyIndent=1
let vimclojure#ParenRainbow=1

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

let g:trailing_whitespace_deletion = 0
function! s:ToggleWhitespaceDeletion(should_print)
  augroup no_whitespace
    autocmd!
    if(g:trailing_whitespace_deletion)
      let g:trailing_whitespace_deletion = 0
    else
      autocmd BufWritePre * :%s/\v\s+$//e
      let g:trailing_whitespace_deletion = 1
    endif
    if (a:should_print)
      echo "Turning " . (g:trailing_whitespace_deletion ? "ON" : "OFF" ) . " trailing whitespace deletion"
    endif
  augroup END
endfunction

call <SID>ToggleWhitespaceDeletion(0)

nnoremap <LocalLeader>st :call <SID>ToggleWhitespaceDeletion(1)<cr>
nnoremap <LocalLeader>sd :%s/\v\s+$//e<cr>
nnoremap <LocalLeader>sl :autocmd BufWritePre *<CR>

augroup filetype_golang
  autocmd!
  autocmd BufNewFile,BufRead *.tf set filetype=go
augroup END

augroup filetype_groovy
  autocmd!
  autocmd BufNewFile,BufRead *.gradle set filetype=groovy
augroup END

augroup filetype_ruby
  autocmd!
  autocmd BufNewFile,BufRead Rakefile set filetype=ruby
  autocmd BufNewFile,BufRead Guardfile set filetype=ruby
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead .pryrc set filetype=ruby

  autocmd FileType ruby nnoremap <buffer> <localleader>pp irequire 'pry'; binding.pry<cr><esc>

  autocmd FileType ruby nnoremap <buffer> <localleader>rs :VimuxRunCommand("clear; bundle exec rspec " . expand("%") . ":" . line("."))<cr>
  autocmd FileType ruby nnoremap <buffer> <localleader>rsp :VimuxRunCommand("clear; bundle exec rspec")<cr>
  autocmd FileType ruby nnoremap <buffer> <localleader>rsf :VimuxRunCommand("clear; bundle exec rspec " . expand("%"))<cr>
  autocmd FileType ruby nnoremap <buffer> <localleader>rsl :VimuxRunCommand("clear; bundle exec rspec " . expand("%") . ":" . line("."))<cr>

augroup END

augroup filetype_python
  autocmd!
  autocmd BufWritePost *.py call Flake8()
augroup END

augroup filetype_js
  autocmd!
  autocmd BufNewFile,BufRead *.hbs set filetype=html
augroup END

let g:user_emmet_settings = {
\    'html': {
\      'empty_element_suffix': ' />',
\    }
\}

augroup filetype_html
  autocmd!
augroup END

augroup filetype_haskell
  autocmd!
  autocmd BufNewFile,BufRead *.hs set filetype=haskell
augroup END

augroup filetype_clojure
  autocmd!
  autocmd BufNewFile,BufRead *.hiccup set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs set filetype=clojure
  autocmd BufNewFile,BufRead *.edn set filetype=clojure
  autocmd BufNewFile,BufRead *.cljx set filetype=clojure
  autocmd BufNewFile,BufRead *.clj set filetype=clojure
  autocmd BufNewFile,BufRead *.cljc set filetype=clojure
  autocmd FileType clojure set wildignore+=target/**/*
  autocmd FileType clojure nnoremap <buffer> <localleader>ns1 v%:s/\(\w\)\ \{2,}/\1\ /e<esc>
  autocmd FileType clojure :AddTabularPattern! ns_separator /\(\ \)\@<=\(\(:as\)\|\(:refer\)\|\(:only\)\|\(:exclude\)\).*$
  autocmd FileType clojure nnoremap <buffer> <localleader>ns2 v%:Tabularize ns_separator<cr>

  "nnoremap <C-e> :Eval<CR>
  nmap <C-e> cpp
  nnoremap E :%Eval<CR>
  nnoremap T :RunTests<CR>
augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^[=\\-]\\+$\rkvg_"<cr>
  autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^[=\\-]\\+$\rg_vk0"<cr>
  autocmd FileType markdown iabbrev <buffer> -mdash- —
  autocmd FileType markdown iabbrev <buffer> -ndash- –
augroup END

augroup comments
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
  autocmd FileType javascript vnoremap <buffer> <localleader>c :s/^/\/\/ /<cr>
  autocmd FileType ruby nnoremap <buffer> <localleader>c I# <esc>
  autocmd FileType ruby vnoremap <buffer> <localleader>c :s/^/# /<cr>
  autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
  autocmd FileType clojure nnoremap <buffer> <localleader>c I; <esc>
  autocmd FileType clojure vnoremap <buffer> <localleader>c :s/^/; /<cr>
augroup END

augroup filetype_pml
  autocmd!
  autocmd FileType pml iabbrev <buffer> -mdash- —
  autocmd FileType pml iabbrev <buffer> -ndash- –
augroup END

nnoremap <silent> <leader>rr :1,$retab<CR>
nnoremap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>
nnoremap <silent> <leader>q :set invpaste<CR>:set paste?<CR>

" Window sizing & naviation {{{
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
" }}}

noremap <LocalLeader>t :!ctags -R --langmap="lisp:+.clj" .<CR>
nnoremap <Leader>rt :!ctags -R *<CR>

noremap <Leader>rb :call VimuxRunCommand("bundle exec rspec " . bufname("%"))<CR>
noremap <Leader>rp :VimuxPromptCommand<CR>
noremap <Leader>rl :VimuxRunLastCommand<CR>
noremap <Leader>ri :VimuxInspectRunner<CR>
noremap <Leader>rq :VimuxCloseRunner<CR>
noremap <Leader>rs :VimuxInterruptRunner<CR>
noremap <LocalLeader>vp :VimuxPromptCommand<CR>
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction
vnoremap <LocalLeader>vs "vy :call VimuxSlime()<CR>

" TODO: use functions or something instead of bindings?
nmap <LocalLeader>vf ggVG<LocalLeader>vs<CR><C-o><C-o>
nmap <LocalLeader>vs vip<LocalLeader>vs<CR>
nmap <LocalLeader>vl V<LocalLeader>vs<CR>

imap <C-j> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" ex mode bites
nnoremap Q <nop>

