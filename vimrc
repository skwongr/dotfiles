set encoding=utf-8

" Install vim-plug and config plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'lisposter/vim-blackboard'
Plug 'luochen1990/rainbow'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tmux-plugins/vim-tmux-focus-events'

if !empty(glob('/usr/local/opt/fzf'))
  " Homebrew install
  Plug '/usr/local/opt/fzf'
else
  " Git install
  Plug '~/.fzf'
endif
Plug 'junegunn/fzf.vim'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

call plug#end()

" Set leader to space
let mapleader = " "

" Enable Rainbow
let g:rainbow_active = 1

" Shortcut to tabular
vnoremap <leader>: :Tab /:\zs/l0l1<CR>
vnoremap <leader>= :Tab /=<CR>
vnoremap <leader>{ :Tab /{<CR>

" NerdTree
map <leader>e :NERDTreeToggle<CR>
map <C-e> :NERDTreeFind<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen = 1
" Alias :nfind to :NerdTreeFind
cnoreabbrev nfind NERDTreeFind

" Ack.vim config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
elseif executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
let g:ackhighlight = 1
" Alias :find to :Ack
cnoreabbrev find tabnew\|Ack

" FZF
nnoremap <C-p> :tabnew<CR>:GFiles<CR>
cnoreabbrev nag tabnew\|Ag

" Commentary
noremap <leader>/ :Commentary<cr>
autocmd FileType html.handlebars setlocal commentstring={{!--\ %s\ --}}

" EasyMotion
map \ <Plug>(easymotion-prefix)
map <C-f> <Plug>(easymotion-f)

" Coc
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

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
nnoremap <esc><esc> :noh<CR>

" Wrap text instead of being on one line
set lbr
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

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

" Set pastetoggle hotkey
set pastetoggle=<F2>

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
vnoremap /? y:tabnew\|Ack <C-R>"<CR>

" Duplicate the current tab
nnoremap <leader>t :tab split<CR> :NERDTreeFind<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Quicker tab movement
nnoremap <C-h> gT
nnoremap <C-l> gt

" Quicker newline
nnoremap <leader><CR> o<ESC>
