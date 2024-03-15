vim.api.nvim_set_hl(0, 'LineNr', {fg='Grey42'})
vim.api.nvim_set_hl(0, 'NonText', {fg='Grey42'})
vim.api.nvim_set_hl(0, 'NormalFloat', {fg='White', bg='NONE'})
vim.api.nvim_set_hl(0, 'MatchParen', {fg='White', bg='Grey42'})
vim.api.nvim_set_hl(0, 'Visual', {bg='Grey30'})

-- Column to the left of the line numbers
vim.api.nvim_set_hl(0, 'SignColumn', {fg='DarkGrey', bg='NONE'})

-- GitGutter Palette
vim.api.nvim_set_hl(0, 'GitGutterAdd', {fg='Green', bg='NONE'})
vim.api.nvim_set_hl(0, 'GitGutterChange', {fg='Yellow', bg='NONE'})
vim.api.nvim_set_hl(0, 'GitGutterDelete', {fg='Red', bg='NONE'})

-- VimFugitive Palette
vim.api.nvim_set_hl(0, 'DiffAdd', {bg='#006600'})
vim.api.nvim_set_hl(0, 'DiffChange', {fg='None', bg='None'})
vim.api.nvim_set_hl(0, 'DiffDelete', {bg="#660000"})
vim.api.nvim_set_hl(0, 'DiffText', {bg='#888800'})

-- LspDiagnostics Palette
vim.api.nvim_set_hl(0, 'DiagnosticSignError', {fg='Red', bg='NONE'})
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', {fg='Yellow', bg='NONE'})

-- Glyph Palette Setup
vim.api.nvim_create_augroup('my_glyph_palette', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'my_glyph_palette',
  pattern = {'fern', 'nerdtree', 'startify'},
  callback = function()
    vim.fn['glyph_palette#apply']()
  end,
})
