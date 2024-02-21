autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2

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
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set wrap
set linebreak
set breakindent
set encoding=utf-8
set foldmethod=indent
set foldlevel=3
set ignorecase smartcase
set relativenumber

"Sets the leader key to space
let mapleader = " "
nnoremap <Space> <Nop>

"Replace the highlighted text with the system clipboard
nnoremap <leader>p _dP

"Move a line up or down
nnoremap <Leader><Up> :m .-2<CR>
nnoremap <Leader><Down> :m .+1<CR>

"Sets the colors of the line numbers
highlight LineNr ctermfg=darkgrey
highlight nonText ctermfg=darkgrey
highlight NormalFloat ctermfg=white ctermbg=darkgrey
highlight MatchParen ctermfg=white ctermbg=darkgrey

"Nerdtree toggle
nnoremap <D-s> :NERDTreeToggle<CR>

"Close nerdtree when selecting a file 
let NERDTreeQuitOnOpen=1

"Show hidden files with NERDTree
let NERDTreeShowHidden=1

"Search with command + f
nnoremap <D-f> /

"Close nerdtree when opening a file
let NERDTreeQuitOnOpen=1

"Control arrow keys for window navigation
nnoremap <C-W><Up> <C-W>k
nnoremap <C-W><Down> <C-W>j
nnoremap <C-W><Left> <C-W>h
nnoremap <C-W><Right> <C-W>l

"Adds in the classic control backspace and delete functionality
inoremap <C-BS> <C-o>dB
inoremap <C-Del> <C-o>de

"Map home and end keys to beginning and end of line
noremap <silent> <Home> ^
noremap <silent> <End> $
inoremap <silent> <Home> <C-o>^
inoremap <silent> <End> <C-o>$

"ADds in the classic control backspace and delete
inoremap <C-BS> <C-o>dB
inoremap <C-Del> <C-o>de

"Smooth scroll keybinds
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>
noremap <silent> <PageUp> :call smooth_scroll#up(&scroll, 10, 2)<cr>
noremap <silent> <PageDown> :call smooth_scroll#down(&scroll, 10, 2)<cr>
inoremap <silent> <PageUp> :call smooth_scroll#up(&scroll, 10, 2)<cr>
inoremap <silent> <PageDown> :call smooth_scroll#down(&scroll, 10, 2)<CR>

"Home and End keys
noremap <silent> <Home> ^
noremap <silent> <End> $
inoremap <silent> <Home> <C-o>^
inoremap <silent> <End> <C-o>$

call plug#begin('~/.config/nvim/plugged')
    Plug 'ryanoasis/vim-devicons' "NerdTree icons
    Plug 'scrooloose/nerdtree' "File explorer
    Plug 'preservim/nerdcommenter' "Commenting
    Plug 'github/copilot.vim' "GitHub Copilot
    Plug 'majutsushi/tagbar' "Code outline
    Plug 'ap/vim-css-color' "CSS color preview
    Plug 'terryma/vim-smooth-scroll' "Smooth scroll with ctrl+u and ctrl+d
    Plug 'tpope/vim-fugitive' "Git commands
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax highlighting
    Plug 'lambdalisue/glyph-palette.vim' "NerdTree icon colors
    Plug 'williamboman/mason.nvim' "Package manager
    Plug 'williamboman/mason-lspconfig.nvim' "LSP
    Plug 'neovim/nvim-lspconfig' "LSP
    Plug 'lukas-reineke/indent-blankline.nvim' "Indent line characters
    Plug 'nvim-lualine/lualine.nvim' "Status line
    Plug 'lervag/vimtex'
call plug#end()

"Glyph Palette setup
augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"Ignore files in NERDTree
let NERDTreeIgnore = ['^__pycache__$', '^.DS_Store$', '^.git$', '^.venv$']

lua <<EOF
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").pyright.setup {}
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
require("ibl").setup { 
    indent = { char = "│" },
    scope = { enabled = false },
}
require("lualine").setup { options = { theme = "dracula" } }
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "latex" },
  },
}
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})
EOF
