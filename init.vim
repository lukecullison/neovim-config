" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Simple and essential plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'

" Add color scheme plugins
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'Th3Whit3Wolf/one-nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/everforest'
Plug 'drewtempelmeyer/palenight.vim'

" Add color scheme plugins
Plug 'sickill/vim-monokai'
Plug 'kaicataldo/material.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'haishanh/night-owl.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Status Line
Plug 'hoob3rt/lualine.nvim'

" Autocompletion plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

" General Settings
set number
set termguicolors
set expandtab
set shiftwidth=4
set tabstop=4
set cursorline
set ignorecase  " Always ignore case during search
set smartcase   " Override ignorecase if search pattern contains uppercase letters 

" Theme settings
syntax enable
set background=dark
" colorscheme tokyonight 
" colorscheme gruvbox   " Gruvbox: A retro-groove color scheme with a focus on contrast and readability.
" colorscheme dracula   " Dracula: A dark theme that is elegant and easy on the eyes.
" colorscheme nord      " Nord: An arctic, north-bluish color palette.
" colorscheme ayu       " Ayu: A simple, bright, and elegant theme.
" colorscheme OceanicNext " Oceanic Next: A beautiful, calm, and simple theme.
" colorscheme everforest " Everforest: A pastel-colored, low-contrast theme - easy on the eyes.
" colorscheme palenight " Palenight: A sophisticated and vibrant color scheme.

" colorscheme monokai     " Monokai: A popular theme with vibrant colors, including shades of orange.
" colorscheme material    " Material: A theme with a dark background and orange accents.
colorscheme gruvbox     " Gruvbox: A retro-groove color scheme with dark and light modes.
" colorscheme codedark    " Dark+: A theme inspired by the default dark theme of Visual Studio Code.
" colorscheme night-owl   " Night Owl: A theme designed to be easy on the eyes

" Nvim Tree setup
lua << EOF
require'nvim-tree'.setup {}
EOF

" Gitsigns setup
lua << EOF
require('gitsigns').setup()
EOF

" Lualine setup
lua << EOF
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
EOF

" Nvim-cmp setup
lua << EOF
  local cmp = require'cmp'

  cmp.setup({
    completion = {
      autocomplete = { require'cmp.types'.cmp.TriggerEvent.TextChanged }, -- Enable automatic popup on text change
    },
    snippet = {
      expand = function(args)
        -- No snippet expansion for minimal config
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 's' }),
      ['('] = function(fallback) fallback() end, -- Do nothing when '(' is pressed
      ['{'] = function(fallback) fallback() end, -- Do nothing when '{' is pressed
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

" LSP configuration
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
