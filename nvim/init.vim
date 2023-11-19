syntax on

let g:hybrid_custom_term_colors = 1
set background=dark

colorscheme hybrid

set nocompatible
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
    Plug 'preservim/nerdtree'
    Plug 'vimsence/vimsence'

    Plug 'github/copilot.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    call plug#end()

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" remaps

    " replace all
    nnoremap <C-r> :%s//g<Left><Left>

    " vim tree
    nnoremap <leader>\ :NERDTreeToggle<CR>

    " spell check
    map S :setlocal spell! spelllang=en_us<CR>

" movement
    map J k
    map K j

"""NeoVide
if exists("g:neovide")
    set guifont="Inconsolata Nerd:h14"
    "let g:neovide_transparency = 0.8
    let g:neovide_cursor_vfx_mode = "pixiedust"
endif
