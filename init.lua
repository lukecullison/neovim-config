-- Basic settings
vim.cmd('syntax enable')
vim.cmd('set background=dark')

-- Install packer.nvim if not installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- Autocommand to reload Neovim whenever you save the init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

-- Plugin management using packer.nvim
require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'
  
  -- Colorschemes
  use 'folke/tokyonight.nvim'
  use 'morhetz/gruvbox'
  use 'dracula/vim'
  use 'arcticicestudio/nord-vim'
  use 'ayu-theme/ayu-vim'
  use 'mhartington/oceanic-next'
  use 'sainnhe/everforest'
  use 'drewtempelmeyer/palenight.vim'
  use 'sickill/vim-monokai'
  use 'kaicataldo/material.vim'
  use 'tomasiser/vim-code-dark'
  use 'haishanh/night-owl.vim'

  -- LSP and autocompletion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'nvim-treesitter/nvim-treesitter'

  -- Golang
  use 'fatih/vim-go'

  -- C/C++
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Other useful plugins
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'windwp/nvim-autopairs'
end)

-- Colorscheme setup
vim.cmd('colorscheme gruvbox') -- Set your default colorscheme here

-- LSP settings
local lspconfig = require('lspconfig')

-- Go language server
lspconfig.gopls.setup{}

-- C/C++ language server
lspconfig.clangd.setup{}

-- Autocompletion settings
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

-- Treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "go", "lua", "python", "javascript", "html", "css" },
  highlight = {
    enable = true,
  },
}

-- Autopairs setup
require('nvim-autopairs').setup{}

