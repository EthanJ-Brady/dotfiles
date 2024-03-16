-- Setup lazy nvim plugins
require("lazy").setup({
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                integrations = {
                    mason = true,
                }
            })
        end
    },
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
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                toggler = {
                    line = '<Leader>/',
                    block = '<Leader><Leader>/',
                },
                opleader = {
                    line = "<Leader>/",
                    block = '<Leader><Leader>/',
                },
            })
        end
    },                                          -- Commenting
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({})
        end,
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
                    additional_vim_regex_highlighting = false,
                    disable = { "latex" },
                },
            }
        end
    },                                          -- Syntax highlighting
    {
        'lambdalisue/glyph-palette.vim',
    },                                          -- NerdTree icon colors
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup {}
        end
    },                                          -- LSP manager
    {
       'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup {}
        end
    },                                          -- LSP
    {
        'neovim/nvim-lspconfig',
        config = function ()
            require('lspconfig').pyright.setup {}
        end
    },                                          -- LSP
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require('ibl').setup {
                indent = { char = "│" },
                scope = { enabled = false },
            }
        end
    },                                          -- Indent line characters
    {
        'nvim-lualine/lualine.nvim',
        config = function ()
            require('lualine').setup {
                options = {
                    theme = 'catppuccin',
                    disabled_filetypes = {
                        'NvimTree',
                    },
                },
            }
        end
    },                                          -- Status line
    {
        'lervag/vimtex',
        ft = { 'tex' },
    },                                          -- Latex helper
    {
        'nvimdev/lspsaga.nvim',
        config = function ()
            require('lspsaga').setup()
        end
    },                                          -- LSP UI
    {
        'airblade/vim-gitgutter',
    },                                          -- Git diff
    {
        'dstein64/vim-startuptime'
    },                                          -- View startup timing information
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
    {"hrsh7th/nvim-cmp"}, -- The main completion plugin
    {"hrsh7th/cmp-nvim-lsp"}, -- LSP source for nvim-cmp
    {"hrsh7th/cmp-buffer"}, -- Buffer completions
    {"hrsh7th/cmp-path"}, -- Path completions
    {"hrsh7th/cmp-cmdline"}, -- Command line completions
    {"saadparwaiz1/cmp_luasnip"}, -- Snippet completions
    {"L3MON4D3/LuaSnip"}, -- Snippet engine
    {"rafamadriz/friendly-snippets"}, -- A collection of snippets
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },
})

-- Snippet setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
}
