let mapleader=" "
set guifont=Monaco:h13
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*


function! s:InstallVimPlug()
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endfunction

call s:InstallVimPlug()

call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'christianchiarulli/nvcode-color-schemes.vim'


" Status bar and git worktree
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'


" status bar
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ojroques/nvim-hardline'

" revive sessions
Plug 'tpope/vim-obsession'

" todo comments
Plug 'folke/todo-comments.nvim'

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/vim-apm'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'akinsho/toggleterm.nvim'
Plug 'mbbill/undotree'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
" Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'chrisbra/Colorizer'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'folke/which-key.nvim'
" Plug 'luochen1990/rainbow'

" Format, code help
Plug 'vim-autoformat/vim-autoformat'
Plug 'psf/black'
Plug 'prettier/vim-prettier'
Plug 'github/copilot.vim'
Plug 'ggandor/lightspeed.nvim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'ThePrimeagen/vim-be-good'

" Language related
Plug 'vim-python/python-syntax'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer',
Plug 'tpope/vim-commentary'
Plug 'jmcantrell/vim-virtualenv'
Plug 'kosayoda/nvim-lightbulb'
Plug 'folke/trouble.nvim'

" Auto complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" dev icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()

lua require('ceres')
" Load session
fun! Startup()
    if filereadable('Session.vim')
        call inputsave()
        let name = input("Found session file, load it? (y/n) ")
        call inputrestore()
        if name == 'y'
            source Session.vim
        endif
    endif
endfunction

au VimEnter * call Startup()


" Edit vimr configuration file
nnoremap <leader>er :e $MYVIMRC<CR>
nnoremap <leader>el :so $MYVIMRC<CR>
nnoremap <leader>eL :lua require('ceres.functions').load()<CR>
nnoremap <leader>u :UndotreeShow<CR>


syntax on

set background=dark
" set clipboard=unnamed
set encoding=UTF-8
set completeopt=menu,menuone,noselect
set shortmess+=c
set textwidth=120
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set autowrite
set mouse=a
set cursorline

set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Tabbing
set tabstop=4 softtabstop=2
set shiftwidth=4
set expandtab
set smartindent
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=120
set termguicolors

let g:python3_host_prog="/usr/local/bin/python3"
" auto format when buffer is being written, vim-autoformat
" load lua syntax in vim
let g:vimsyn_embed = 'lPr'


" highlight Normal guibg=none ctermbg=none
" highlight NonText guibg=none
let g:LanguageClient_serverCommands = {
            \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
            \ }
