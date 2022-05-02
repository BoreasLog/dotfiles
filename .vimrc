" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = ","

"my stuff
"
set t_Co=256   " This is may or may not needed.
colorscheme PaperColor
set background=dark
set number
set laststatus=2

"plugged ------------------------
call plug#begin()

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

Plug 'vimwiki/vimwiki'
Plug 'psliwka/vim-smoothie'

call plug#end()
"-------------------------------

let g:goyo_width = 60

map <leader>gy :Goyo<CR>
map <leader>ll :Limelight!!<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

noremap <leader>tc :tabclose<cr>
nnoremap <silent><leader>o :FZF<CR>

noremap <F5> :setlocal spell! spelllang=en_us<CR>
set clipboard=unnamed
set clipboard=unnamedplus
" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler


" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

"disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>


" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search


" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

