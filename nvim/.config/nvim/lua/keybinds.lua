-- Sets the leader key to space
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', {noremap = true})

-- Replace the highlighted text with the system clipboard
vim.api.nvim_set_keymap('n', '<leader>p', '_dP', {noremap = true})

-- Move a line up or down
vim.api.nvim_set_keymap('n', '<Leader><Up>', ':m .-2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader><Down>', ':m .+1<CR>', {noremap = true})

-- Nerdtree toggle
vim.api.nvim_set_keymap('n', '<D-s>', ':NERDTreeToggle<CR>', {noremap = true})

-- Search with command + f
vim.api.nvim_set_keymap('n', '<D-f>', '/', {noremap = true})

-- Control arrow keys for window navigation
vim.api.nvim_set_keymap('n', '<C-W><Up>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-W><Down>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-W><Left>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-W><Right>', '<C-W>l', {noremap = true})

-- Adds in the classic control backspace and delete functionality
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-o>dB', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-Del>', '<C-o>de', {noremap = true})

-- Map home and end keys to beginning and end of line
vim.api.nvim_set_keymap('n', '<Home>', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<End>', '$', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<Home>', '<C-o>^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<End>', '<C-o>$', {noremap = true, silent = true})

-- Smooth scroll in normal mode
vim.cmd [[
    nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
    nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
    nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
    nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>
    nnoremap <silent> <PageUp> :call smooth_scroll#up(&scroll, 10, 2)<CR>
    nnoremap <silent> <PageDown> :call smooth_scroll#down(&scroll, 10, 2)<CR>
]]

-- Smooth scroll in insert mode
vim.cmd [[
    inoremap <silent> <PageUp> <Esc>:call smooth_scroll#up(&scroll, 10, 2)<CR>gi
    inoremap <silent> <PageDown> <Esc>:call smooth_scroll#down(&scroll, 10, 2)<CR>gi
]]

-- Keymaps for LSP functionalities
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga peek_definition<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rn', ':Lspsaga rename<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', ':Lspsaga finder<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':Lspsaga outline<CR>', {noremap = true, silent = true})
