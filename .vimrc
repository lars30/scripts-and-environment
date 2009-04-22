"Larry's settings

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"theme
syntax on
colorscheme ir_black

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
 
set nobackup
set nowritebackup
set history=50    " keep 50 lines of command line history
set ruler    " show the cursor position all the time
set showcmd    " display incomplete commands
set incsearch    " do incremental searching

"tabs and indent
set expandtab
set shiftwidth=2
set smartindent
set tabstop=2
set smarttab
set softtabstop=2

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
 
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
 
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
 
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif
 
  augroup END
 
else
  set autoindent    " always set autoindenting on
 
endif " has("autocmd")
 
if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=1
  set foldnestmax=2
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
 
  " automatically open folds at the starting cursor position
  " autocmd BufReadPost .foldo!
endif

" \ is the leader character
let mapleader = "\\"
 
" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>
 
" Leader shortcuts for Rails commands
map <Leader>m :Rmodel
map <Leader>c :Rcontroller
map <Leader>v :Rview
map <Leader>u :Runittest
map <Leader>f :Rfunctionaltest
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
map <Leader>p :Rprev
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>


" Hide search highlighting
map <Leader>h :set invhls <CR>
 
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
 
" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
 
" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
 
" Maps autocomplete to tab
imap <S-TAB> <C-N>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>
 
" Duplicate a selection
" Visual mode: D
vmap D y'>p

"selection
set keymodel=startsel,stopsel
set selectmode=mouse,key

" fullscreen
set fuoptions=maxvert,maxhorz

" render tabs and trailingspaces
set list listchars=tab:»·,trail:·

" Always display the status line
set laststatus=2

" remap of buffer browsing
:noremap <f1> :bprev<return> 
:noremap <f2> :bnext<return> 

"highlighting
set hlsearch
set ruler

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full

" case only matters with mixed case expressions
set ignorecase
set smartcase


"macros
ab BEG <CR><!--- BEGIN: ---><CR><!--- END: ---><CR><ESC>2k2wa

" lose the tool bar
set go-=T
