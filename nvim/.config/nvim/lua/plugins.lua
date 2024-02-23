
-- Setup Mason
require("mason").setup()

-- Setup Mason LSPconfig
require("mason-lspconfig").setup()

-- Setup LSP for Python with Pyright
require("lspconfig").pyright.setup {}

-- Setup for indent-blankline plugin with Lua
require("ibl").setup { 
    indent = { char = "│" },
    scope = { enabled = false },
}

-- Setup for lualine with the 'dracula' theme
require("lualine").setup { options = { theme = "dracula" } }

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "latex" },
  },
}

-- Setup for lspsaga.nvim
require("lspsaga").setup({})
