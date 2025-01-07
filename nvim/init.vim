" =============================================================================
"  General Settings
" =============================================================================

" Enable syntax highlighting
syntax enable

" Use hybrid colorscheme
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid

" Set file encoding
set encoding=utf-8

" Disable swap files for performance and simplicity
set noswapfile

" Clipboard sharing
set clipboard+=unnamedplus

" Enable relative numbers
set number

" Indentation and basic text manipulation
set smartindent       " Smart indentation
set smartcase         " Case-insensitive search unless uppercase is used
set incsearch         " Show search matches as you type

" Split window behavior
set splitbelow splitright

" Wildcard completion behavior
set wildmode=longest:full,full

" Tab behavior
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Disable automatic commenting for easier commenting with plugins
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" =============================================================================
" Plugin Management (vim-plug)
" =============================================================================

call plug#begin('~/.vim/plugged')

    " Appearance and UI
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " Text manipulation
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'preservim/nerdcommenter'

    " Language support
    Plug 'sheerun/vim-polyglot'

    " File explorer
    Plug 'preservim/nerdtree'

    " Git integration
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Discord presence
    Plug 'andweeb/presence.nvim'

    " Telescope for fuzzy finding
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Code completion and AI
    Plug 'github/copilot.vim'

    " Mason (LSP, DAP, linter, formatter manager)
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    " Language server protocol (LSP)
    Plug 'neovim/nvim-lspconfig'

    " Autocompletion LSP
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'L3MON4D3/LuaSnip'

    " null-ls (for linters and formatters)
    Plug 'jose-elias-alvarez/null-ls.nvim'

    " Diagnostics UI (optional UI for LSP diagnostics)
    Plug 'j-hui/fidget.nvim'

    " Rust language tools
    Plug 'rust-lang/rust.vim'

    " Go language tools
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Latex tools
    Plug 'lervag/vimtex'

call plug#end()

" =============================================================================
" Language Specific Configurations
" =============================================================================

" [Rust.vim] Syntax checker provider
let g:syntastic_rust_checkers = ['cargo']

" ZIG Formatter autosave - disable
let g:zig_fmt_autosave = 0

" =============================================================================
" Telescope Configurations
" =============================================================================

" Find files
nnoremap <leader>f <cmd>Telescope find_files<cr>
" Live grep
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Find open buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Find help tags
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" =============================================================================
" Vimtex Configurations
" =============================================================================

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let maplocalleader = ","

" =============================================================================
" Discord Presence
" =============================================================================

let g:presence_neovim_image_text="The One True Text Editor"
let g:presence_main_image="file"

" =============================================================================
" Airline Configurations
" =============================================================================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

" for vimtex
let g:airline#extensions#vimtex#enabled = 1

" Enable filetype plugins and indentation
filetype plugin indent on

" =============================================================================
" UI Settings
" =============================================================================

" Disable --INSERT-- mode display
set noshowmode

" Enable true color support for nvim-colorizer
set termguicolors

" Setup nvim-colorizer
lua require'colorizer'.setup()

" =============================================================================
" Cursor highlight line
" =============================================================================

hi CursorLine   cterm=NONE ctermbg=256
hi CursorColumn cterm=NONE ctermbg=257
nnoremap <Leader>b :set cursorline! <CR>

" =============================================================================
" Fidget Configuration
" =============================================================================

highlight FidgetTask guibg=NONE ctermbg=NONE

" =============================================================================
" Remaps
" =============================================================================

nnoremap <C-r> :%s//g<Left><Left>

" Toggle NerdTree
nnoremap <leader>\ :NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeFocus<CR>

" NERDTree setup
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$']

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Spell check toggle
map S :setlocal spell! spelllang=en_us<CR>

" Movement
map J k
map K j

" Quick save and exit
map zz :wq<CR>
map zx :q!<CR>
map zs :w<CR>

" Ergonomic save and exit
map <leader>w :wq<CR>
map <leader>q :q!<CR>
map <leader>s :w<CR>

" =============================================================================
" Copilot Setup
" =============================================================================

" Disable copilot for text and markdown files
autocmd FileType text let g:copilot_enabled = 0
autocmd FileType markdown let g:copilot_enabled = 0

" =============================================================================
" NeoVide Setup
" =============================================================================

if exists("g:neovide")
    set guifont="Inconsolata"
    let g:neovide_transparency = 0.75
    let g:airline_powerline_fonts = 0
    let g:neovide_cursor_vfx_mode = "pixiedust"
endif

" =============================================================================
" LSP Setup
" =============================================================================

lua << EOF
-- Keymap utility functions
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(0, ...) end

-- Global settings for LSP client.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

-- Keymap settings (defined in the on_attach function)
local lsp_keymaps = function(bufnr)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration" })
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover information" })
  buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format document" })
  buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })
  buf_set_keymap("n", "<leader>l ", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Diagnostics" })
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Show references" })
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
end

-- On attach callback to apply keymaps and custom settings
local on_attach = function(client, bufnr)
  -- Add LSP keymaps.
  lsp_keymaps(bufnr)
end

-- Mason configurations
require("mason").setup {}

require("mason-lspconfig").setup {
  -- List of servers to automatically install if they're not already installed
  ensure_installed = {
    "pyright",
    "gopls",
    "rust_analyzer",
    "clangd",
    "zls",
    "jdtls",
    "texlab",
    "rnix",

    "bashls",
    "jsonls",
    "cssls",
    "svelte",
    "asm_lsp",
    "csharp_ls",
    "neocmake",
    "ast_grep",
    "dockerls",
    "glslls",
    "graphql",
    "html",
    "htmx",
    "denols",
    "harper_ls",
    "glsl_analyzer",
    "opencl_ls",
    "prismals",
    "sqlls",
    "tinymist",
    "vimls",
    "vuels",
  },
  -- Whether servers that are set up (via lspconfig) should be automatically installed
  automatic_installation = true,
}

-- LSP server configurations
local servers = {
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          typeCheckingMode = "basic",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        cargo = {
          allFeatures = true,
        }
      },
    },
  },
  clangd = {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  },
  zls = {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  },
  dartls = {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  },
  jdtls = {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  },
  texlab = {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  },
  rnix = {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for server, config in pairs(servers) do
  config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, config or {})

  require("lspconfig")[server].setup(config)
end

-- null-ls (for formatters/linters not provided by LSP)
local null_ls = require("null-ls")

null_ls.setup({
  -- on_attach = on_attach, -- Remove on_attach from here
  sources = {
    -- Get formatters and linters from Mason
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black.with({
      extra_args = { "--fast" },
      -- Only use black if a .git or pyproject.toml is present
      condition = function(utils)
        return utils.root_has_file({".git", "pyproject.toml"})
      end,
    }),
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.rustfmt,
  },
})

-- cmp setup
local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Diagnostics UI (fidget.nvim)
require("fidget").setup({
    notification = {
        window = {
            winblend = 0,
        }
    }
})
EOF
