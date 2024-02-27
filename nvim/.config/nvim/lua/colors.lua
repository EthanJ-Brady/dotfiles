vim.api.nvim_set_hl(0, 'LineNr', {ctermfg='DarkGrey'})
vim.api.nvim_set_hl(0, 'NonText', {ctermfg='DarkGrey'})
vim.api.nvim_set_hl(0, 'NormalFloat', {ctermfg='White', ctermbg='NONE'})
vim.api.nvim_set_hl(0, 'MatchParen', {ctermfg='White', ctermbg='DarkGrey'})

-- Column to the left of the line numbers
vim.api.nvim_set_hl(0, 'SignColumn', {ctermfg='DarkGrey', ctermbg='NONE'})

-- GitGutter Palette
vim.api.nvim_set_hl(0, 'GitGutterAdd', {ctermfg='Green', ctermbg='NONE'})
vim.api.nvim_set_hl(0, 'GitGutterChange', {ctermfg='Yellow', ctermbg='NONE'})
vim.api.nvim_set_hl(0, 'GitGutterDelete', {ctermfg='Red', ctermbg='NONE'})

-- LspDiagnostics Palette
vim.api.nvim_set_hl(0, 'DiagnosticSignError', {ctermfg='Red', ctermbg='NONE'})
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', {ctermfg='Yellow', ctermbg='NONE'})

-- Glyph Palette Setup
vim.api.nvim_create_augroup('my_glyph_palette', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'my_glyph_palette',
  pattern = {'fern', 'nerdtree', 'startify'},
  callback = function()
    vim.fn['glyph_palette#apply']()
  end,
})
