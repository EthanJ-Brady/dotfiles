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
        'tpope/vim-fugitive',
    },                                          -- Git commands
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "python", "markdown", "markdown_inline", "html", "css", "javascript", "typescript", "lua", "json", "yaml", "toml", "bash", "c", "cpp", "rust", "go", "java", "regex", "tsx", "nix" },
                highlight = {
                    enable = true,
                },
            }
        end
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
    {
        "karb94/neoscroll.nvim",
        config = function ()
            require('neoscroll').setup {
                easing_function = "quadratic",
            }
            local t = {}
            t['<PageUp>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
            t['<PageDown>'] = {'scroll', {'vim.wo.scroll', 'true', '100'}}
            require('neoscroll.config').set_mappings(t)
        end
    },                                          -- Smooth scrolling
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
