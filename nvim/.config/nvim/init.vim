autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set wrap
set linebreak
set breakindent
set encoding=utf-8
set foldmethod=indent
set foldlevel=3

"Nerdtree toggle
nnoremap <D-s> :NERDTreeToggle<CR>

"Search with command + f
nnoremap <D-f> /

"Control arrow keys for window navigation
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l

"Smooth scroll keybinds
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>

"Folding toggle
noremap <space> za

"Show hidden files with NERDTree
let NERDTreeShowHidden=1

call plug#begin('~/.config/nvim/plugged')
 Plug 'ryanoasis/vim-devicons'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'github/copilot.vim'
 Plug 'majutsushi/tagbar'
 Plug 'ap/vim-css-color'
 Plug 'terryma/vim-smooth-scroll'
 Plug 'tpope/vim-fugitive'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"Automatically enable tree-sitter syntax highlighting for supported languages
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

"Ignore files in NERDTree
let NERDTreeIgnore = ['^__pycache__$', '^.DS_Store$', '^.git$', '^.venv$']

