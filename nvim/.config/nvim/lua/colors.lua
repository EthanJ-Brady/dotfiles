vim.api.nvim_set_hl(0, 'LineNr', {ctermfg='DarkGrey'})
vim.api.nvim_set_hl(0, 'NonText', {ctermfg='DarkGrey'})
vim.api.nvim_set_hl(0, 'NormalFloat', {ctermfg='White', ctermbg='DarkGrey'})
vim.api.nvim_set_hl(0, 'MatchParen', {ctermfg='White', ctermbg='DarkGrey'})

-- Glyph Palette Setup
vim.api.nvim_create_augroup('my_glyph_palette', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'my_glyph_palette',
  pattern = {'fern', 'nerdtree', 'startify'},
  callback = function()
    vim.fn['glyph_palette#apply']()
  end,
})
