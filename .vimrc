" Styling
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

nnoremap <C-t> :NERDTreeToggle<CR>

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" Vim-Plug plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'
Plug 'preservim/nerdtree'
call plug#end()

" Ale config
let g:ale_enbaled = 1
let g:ale_linters = {'cpp': ['gcc']}
let g:ale_linters = {'python': ['flake8']}
