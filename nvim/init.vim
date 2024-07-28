syntax enable

let g:hybrid_custom_term_colors = 1
set background=dark

colorscheme hybrid

set encoding=utf-8
set noswapfile

" CLIPBOARD
set clipboard+=unnamedplus

" indentation and looks

    " set relativenumber
    set number
    set smartindent
    set smartcase
    set incsearch

" vertical and horizontal splits
    set splitbelow splitright
    set wildmode=longest

" tabs and stuff
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab

" removing white spaces
    autocmd BufWritePre * %s/\s\+$//e

" disable auto commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" plugins
    call plug#begin('~/.vim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'preservim/nerdcommenter'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'

    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    Plug 'andweeb/presence.nvim'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ctrlpvim/ctrlp.vim'

    Plug 'github/copilot.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " AST
    Plug 'neovim/nvim-lspconfig'                                " LSP

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'

    Plug 'ThePrimeagen/vim-be-good'

    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    call plug#end()

" [Tabnine] Autocompletion
set rtp+=~/.vim/plugged/tabnine-vim

" [Rust.vim] Syntax checker provider
let g:syntastic_rust_checkers = ['cargo']

" LSP
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.rust_analyzer.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.dartls.setup{}
lua require'lspconfig'.svelte.setup{}

let g:presence_neovim_image_text="The One True Text Editor"
let g:presence_main_image="file"

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
"let g:airline#extensions#tabline#enabled = 1

filetype plugin on
filetype plugin indent on

" Disable --INSERT-- (etc.) because it is already shown in the statusline
set noshowmode

"nvim-colorizer settings
set termguicolors
lua require'colorizer'.setup()

""" CtrlP
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" Cursor highlight line
hi CursorLine   cterm=NONE ctermbg=256
hi CursorColumn cterm=NONE ctermbg=257
nnoremap <Leader>b :set cursorline! <CR>

"(Disable/enable) Local cursor line at startup
"augroup CursorLine
  "au!
  "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  "au WinLeave * setlocal nocursorline
"augroup END

" remaps

    " replace all
    nnoremap <C-r> :%s//g<Left><Left>

    " vim tree
    nnoremap <leader>\ :NERDTreeToggle<CR>

    " Start NERDTree. If a file is specified, move the cursor to its window.
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

    " Exit Vim if NERDTree is the only window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " spell check
    map S :setlocal spell! spelllang=en_us<CR>

" movement
    map J k
    map K j

" Quick save and exit
    map zz :wq<CR>
    map zx :q!<CR>
    map zs :w<CR>

"""NeoVide
if exists("g:neovide")
    set guifont="Inconsolata"
    let g:neovide_transparency = 0.75
    let g:airline_powerline_fonts = 0
    let g:neovide_cursor_vfx_mode = "pixiedust"
endif
