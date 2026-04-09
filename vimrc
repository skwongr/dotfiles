set encoding=utf-8

" Install vim-plug and config plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'lisposter/vim-blackboard'
Plug 'mustache/vim-mustache-handlebars'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-endwise'
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
Plug 'rust-lang/rust.vim'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

call plug#end()

" Set leader to space
let mapleader = " "

" Set Ctrl+j to Esc
nnoremap <C-j> <esc>
inoremap <C-j> <esc>
vnoremap <C-j> <esc>

" Commentary
autocmd FileType html.handlebars setlocal commentstring={{!\ %s\ }}

" vim-test
let test#strategy = { 'nearest': 'vimux', 'file': 'vimux' }
" let test#ruby#rspec#executable = "drspec"
nnoremap ttf :VimuxCloseRunner<CR>:TestFile<CR>
nnoremap ttn :VimuxCloseRunner<CR>:TestNearest<CR>
nnoremap ttx :VimuxCloseRunner<CR>

" Change colorscheme from default to blackboard
colorscheme blackboard


" Set backup, swap locations
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Indent automatically depending on filetype
filetype indent plugin on
syntax enable
set autoindent

" Indentation, tab to spaces
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Turn on line numbering. Turn it off with "set nonu"
set number
set relativenumber
noremap <F3> :set invnumber invrelativenumber <CR>
noremap <F4> :set invrelativenumber <CR>

" show current line cursor is on
set cursorline

" Set syntax on
syntax on

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Shortcut to splits work
nnoremap <Leader>\ :vsp<CR>
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>x :q<CR>
nnoremap <Leader>w :w<CR>

" Case insensitive search
set ic
set hlsearch  " Higlhight search
set incsearch " Find as you type search
nnoremap <Leader>h :noh<CR>

" Wrap text instead of being on one line
set lbr
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
" F5 to toggle wrap
noremap <F5> :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
  endif
endfunction

set wildmenu " Better command-line completion
set showcmd  " Show partial commands in the last line of the screen
set wildmode=longest,list,full " Command <Tab> completion, list matches, then longest common part, then all.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a
" support for wide screen
if !has('nvim')
  if has("mouse_sgr")
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  end
endif

" Set pastetoggle hotkey
if !has('nvim')
  set pastetoggle=<F2>
endif

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

set noendofline
set nofixendofline
set linespace=0       " No extra spaces between rows
set showmatch         " Show matching brackets/parenthesis
set scrolljump=5      " Lines to scroll when cursor leaves screen
set scrolloff=3       " Minimum lines to keep above and below cursor
set foldenable        " Auto fold code
set foldmethod=indent " fold based on indent level
set foldlevelstart=20

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set colorcolumn=160
set backspace=2 " make backspace work like most other apps

" auto reload files changed outside of vim
au FocusGained,BufEnter * :checktime
set autoread


" Shortcut to indent
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move lines up/down
nnoremap <leader><Down> :m .+1<CR>==
nnoremap <leader><Up> :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

vnoremap <leader><Down> :m '>+1<CR>gv=gv
vnoremap <leader><Up> :m '<-2<CR>gv=gv
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" Pretty JSON
cabbrev pjson %!python -m json.tool

" Auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap () ()
inoremap [ []<left>
inoremap [] []
inoremap { {}<left>
inoremap {} {  }<left><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Search highlighted text
vnoremap // y/<C-R>"<CR>
nnoremap /w yiw/<C-R>"<CR>

" Duplicate the current tab
nnoremap <leader>t :tab split<CR>
cnoreabbrev tn tabnew

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Quicker tab movement
nnoremap <C-h> gT
nnoremap <C-l> gt

" Quicker newline
nnoremap <leader><CR> o<ESC>

" Run last macro with ease
nnoremap <F8> @@

" fix filetypes
autocmd BufNewFile,BufRead *.gjs set filetype=javascript.glimmer
autocmd BufNewFile,BufRead *.gts set filetype=typescript.glimmer
