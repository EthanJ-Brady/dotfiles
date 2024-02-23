call plug#begin('~/.config/nvim/plugged')
    Plug 'ryanoasis/vim-devicons' "NerdTree icons
    Plug 'scrooloose/nerdtree' "File explorer
    Plug 'preservim/nerdcommenter' "Commenting
    Plug 'github/copilot.vim' "GitHub Copilot
    Plug 'ap/vim-css-color' "CSS color preview
    Plug 'terryma/vim-smooth-scroll' "Smooth scroll with ctrl+u and ctrl+d
    Plug 'tpope/vim-fugitive' "Git commands
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax highlighting
    Plug 'lambdalisue/glyph-palette.vim' "NerdTree icon colors
    Plug 'williamboman/mason.nvim' "Package manager
    Plug 'williamboman/mason-lspconfig.nvim' "LSP
    Plug 'neovim/nvim-lspconfig' "LSP
    Plug 'lukas-reineke/indent-blankline.nvim' "Indent line characters
    Plug 'nvim-lualine/lualine.nvim' "Status line
    Plug 'lervag/vimtex'
    Plug 'nvimdev/lspsaga.nvim' "LSP UI
call plug#end()

lua require("plugins")
lua require("colors")
lua require("keybinds")
lua require("options")
lua require("files")
