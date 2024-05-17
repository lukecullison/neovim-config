" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Simple and essential plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'

" Theme
Plug 'morhetz/gruvbox'

" End vim-plug setup
call plug#end()

" General Settings
set number
set termguicolors
set expandtab
set shiftwidth=2
set tabstop=2
set cursorline

" Theme settings
set background=dark
colorscheme gruvbox

