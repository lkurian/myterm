set rtp+=~/.vim/vundle/
call vundle#rc()
filetype off

Bundle 'tpope/vim-git'
Bundle 'ktvoelker/sbt-vim'
Bundle 'xolox/vim-misc'
Bundle 'csv.vim'
Bundle 'derekwyatt/vim-scala.git'
Bundle 'briancollins/vim-jst.git'
Bundle 'powerline/powerline'
Bundle 'vim-scripts/Rainbow-Parenthsis-Bundle'
Bundle 'sudo.vim'
Bundle 'austintaylor/vim-indentobject'
Bundle 'visualstar.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mrkschan/vim-node-jslint'
Bundle 'milkbikis/IDSearch.vim.git'
Bundle 'AutoTag'
Bundle 'textobj-diff'
Bundle 'textobj-entire'
Bundle 'textobj-fold'
Bundle 'textobj-lastpat'
Bundle 'textobj-syntax'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'matchit.zip'
Bundle 'textobj-user'
Bundle 'textobj-rubyblock'
Bundle 'unimpaired.vim'
Bundle 'errormarker.vim'
Bundle 'abolish.vim'
Bundle 'delimitMate.vim'
Bundle 'camelcasemotion'
Bundle 'railscasts'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'fatih/vim-go'

autocmd FileType haskell compiler hlint
runtime macros/matchit.vim

highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000
let g:rubytest_in_quickfix = 1 
let g:Powerline_symbols = 'fancy'

set nocompatible
:set lazyredraw
set backspace=indent,eol,start
let g:rubytest_cmd_test = "ruby -W0 %p" 
let g:rubytest_cmd_testcase = "ruby -W0 %p -n '/%c/'" 
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch

map Q gq


if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

set nowrap

if has("autocmd")
  filetype plugin indent on

  autocmd BufNewFile,BufRead *.txt setfiletype text

  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  augroup vimrcEx
  au!


  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent

endif

set expandtab

set laststatus=2

let mapleader = ","

map <Leader>R :e doc/README_FOR_APP<CR>

map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
" map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 
map <Leader>rt :Rake<CR>

map <Leader>a :Ack 
map <Leader>x :%s/\s\+$//<CR>
map <Leader>f :%s/    /  /g<CR>

map <Leader>ii :call g:IDSearchCustom()<CR>
map <Leader>iw :call g:IDSearchCurrentWord()<CR>
map <Leader>ix :!mkid .<CR>

map <Leader>gb :Gblame C<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
nmap <leader>gL :Gitv<cr>
nmap <leader>gl :Gitv!<cr>
vmap <leader>gl :Gitv!<cr>


map <Leader>fb :FufBuffer<CR>
map <Leader>ff :FufCoverageFile<CR>
map <Leader>ft :FufTag<CR>
map <Leader>fc :FufChangeList<CR>
map <Leader>fj :FufJumpList<CR>
map <Leader>fm :FufBufferTag<CR>
map <Leader>fk :FufBookmarkFile<CR>
map <Leader>fa :FufBookmarkFileAdd<CR>
map <Leader>fq :FufQuickFix<CR>
map <Leader>fx :!ctags -R *<CR>

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


map <leader>rg :RopeGotoDefinition<CR>
map <Leader>rr :RopeRename<CR>

map <Leader>nh :noh<CR>

map <C-J> :m +1 <CR>
map <C-K> :m -2 <CR>
map <leader>n :NERDTreeFind<CR>
map <leader>m :NERDTreeToggle<CR>


map <leader>ob :OpenBookmark
map <leader>b :Bookmark
" tagbar mapping to t
map <leader>T :TagbarToggle<CR>

cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" format json
map <leader>fj :%!python -m json.tool <CR>

vmap D y'>p

vmap P p :call setreg('"', getreg('0')) <CR>

au! BufRead,BufNewFile *.haml         setfiletype haml

nmap <F1> <Esc>


imap <C-F> <C-R>=expand("%")<CR>

imap <C-L> <Space>=><Space>


command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

if filereadable(".vimrc.local")
  source .vimrc.local
endif

set number
set relativenumber 
set numberwidth=5

let g:snippetsEmu_key = "<S-Tab>"

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

set ignorecase
set smartcase

set tags=./tags;

let g:fuf_splitPathMatching=1

" command -bar -nargs=1 OpenURL :!open <args>
" function! OpenURL()
"   let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
"   echo s:uri
"   if s:uri != ""
" 	  exec "!open \"" . s:uri . "\""
"   else
" 	  echo "No URI found in line."
"   endif
" endfunction
" map <Leader>w :call OpenURL()<CR>

set hidden
set guioptions-=m
set guioptions-=T

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=blue guibg=blue
function! Getcwd_easy()
   let curdir = substitute(getcwd(), '^/home/.*/', "~/", "g")
   return curdir
endfunction
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}[%{Getcwd_easy()}]%=%-14.(%l,%c%V%)\ %P
set shortmess=atI
let g:miniBufExplMapCTabSwitchBufs = 1

set ofu=syntaxcomplete#Complete
set completeopt+=longest,menuone
:highlight Pmenu guibg=brown gui=bold

au Bufenter *.hs compiler ghc

let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/usr/bin/ghc"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir = "/usr/share/doc/ghc6-doc/html/"
" let g:syntastic_enable_signs=1

:filetype plugin on
:nmap <c-tab> :bnext<cr>
:nmap <c-s-tab> :bprevious<cr>



autocmd BufReadPost fugitive://* set bufhidden=delete

set autowriteall

let g:fuf_patternSeparator = ';'
let g:Gitv_WipeAllOnClose = 1
highlight diffAdded guifg=#00ff00
highlight diffRemoved guifg=#ff0000

set t_Co=256
set background=light

autocmd Syntax ruby setlocal foldmethod=syntax
autocmd Syntax python setlocal foldmethod=indent
autocmd Syntax ruby normal zR
autocmd Syntax python normal zR

" let g:notes_directory = '~/Documents/notes'
autocmd FileType python set omnifunc=pythoncomplete#Complete
map <Leader>nt :Note<CR>
map <Leader>ns :NoteFromSelectedText<CR>

" vim-go
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
" set softtabstop=2
" set textwidth=79
" set shiftwidth=2
" set tabstop=2

set smartindent 
set shiftwidth=4 
set tabstop=4 
set expandtab
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
set guioptions+=c
au FocusLost * :wa
set autowriteall
set clipboard=unnamed

au FileType javascript setl sw=4 sts=4 et
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Editing a protected file as 'sudo'
cmap W w !sudo tee % >/dev/null<CR>

