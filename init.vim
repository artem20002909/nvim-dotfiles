set number
set relativenumber

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'glepnir/dashboard-nvim'

Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'vim-python/python-syntax'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'dense-analysis/ale'

Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

colorscheme gruvbox
set background=dark

lua << EOF
  local lspconfig = require('lspconfig')
  local cmp = require('cmp')
  local nvim_tree = require('nvim-tree')

  cmp.setup({
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
    },
  })

  lspconfig.rust_analyzer.setup{}
  lspconfig.pyright.setup{}

require'nvim-web-devicons'.get_icons()

  require('lualine').setup()
  options = { theme = 'gruvbox' }

  require'nvim-tree'.setup {}

  vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
EOF
