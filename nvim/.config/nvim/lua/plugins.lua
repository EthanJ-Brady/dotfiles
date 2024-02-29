-- Setup lazy nvim plugins
require("lazy").setup({
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                view = {
                    cursorline = false,
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    }
                },
            }
        end
    },
    {
        'preservim/nerdcommenter',
    },                                          -- Commenting
    {
        'github/copilot.vim',
    },                                          -- GitHub Copilot
    {
        'ap/vim-css-color'
    },                                          -- CSS color preview
    {
        'terryma/vim-smooth-scroll'
    },                                          -- Smooth scroll with ctrl+u and ctrl+d
    {
        'tpope/vim-fugitive',
    },                                          -- Git commands
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },                                          -- Syntax highlighting
    {
        'lambdalisue/glyph-palette.vim',
    },                                          -- NerdTree icon colors
    {
        'williamboman/mason.nvim'
    },                                          -- LSP manager
    {
        'williamboman/mason-lspconfig.nvim'
    },                                          -- LSP
    {
        'neovim/nvim-lspconfig'
    },                                          -- LSP
    {
        'lukas-reineke/indent-blankline.nvim'
    },                                          -- Indent line characters
    {
        'nvim-lualine/lualine.nvim'
    },                                          -- Status line
    {
        'lervag/vimtex'
    },                                          -- Latex helper
    {
        'nvimdev/lspsaga.nvim'
    },                                          -- LSP UI
    {
        'airblade/vim-gitgutter',
    },                                          -- Git diff
    {
        'dstein64/vim-startuptime'
    },                                          -- View startup timing information
    {
        'ryanoasis/vim-devicons'
    },                                          -- NerdTree icons
})

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
