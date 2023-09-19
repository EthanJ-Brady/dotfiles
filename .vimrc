" Styling
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

set autoindent
set smartindent
set number
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set wrap
set linebreak
set breakindent

nnoremap <C-t> :NERDTreeToggle<CR>

" Vim-Plug plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
call plug#end()

" Ale config
let g:ale_enbaled = 1
let g:ale_linters = {'cpp': ['gcc']}
let g:ale_linters = {'python': ['flake8']}
