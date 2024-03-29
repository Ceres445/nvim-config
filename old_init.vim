﻿let mapleader=" "
" set guifont=Monaco:h13
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildignore+=**/target/*


function! s:InstallVimPlug()
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
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


" Git
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'


" status bar
" Plug 'romgrk/barbar.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ojroques/nvim-hardline'

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" VIM extras
Plug 'dstein64/vim-startuptime'
Plug 'ThePrimeagen/vim-apm'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'akinsho/toggleterm.nvim'
Plug 'mbbill/undotree'
Plug 'folke/trouble.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'folke/which-key.nvim'
Plug 'rmagatti/auto-session',
Plug 'rmagatti/session-lens'
" Plug 'tpope/vim-dadbod'
" Plug 'kristijanhusak/vim-carbon-now-sh'
" Plug 'tpope/vim-obsession'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'p00f/nvim-ts-rainbow'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'folke/twilight.nvim'
" Plug 'ThePrimeagen/refactoring.nvim'

" Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
" Plug 'ziontee113/syntax-tree-surfer'
" Plug 'preservim/nerdtree'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'chrisbra/Colorizer'
" Plug 'luochen1990/rainbow'
Plug 'folke/todo-comments.nvim'

" Format, code help
Plug 'vim-autoformat/vim-autoformat'
Plug 'psf/black'
Plug 'prettier/vim-prettier'
Plug 'github/copilot.vim'
Plug 'ggandor/lightspeed.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'williamboman/mason.nvim'

" Plug 'fatih/vim-go'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'https://git.sr.ht/~p00f/cphelper.nvim'

" " Auto complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"testing coq
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" dev icons
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'
call plug#end()

set termguicolors
lua require('ceres')
" " Load session
" fun! Startup()
"     if filereadable('Session.vim')
"         call inputsave()
"         let name = input("Found session file, load it? (y/n) ")
"         call inputrestore()
"         if name == 'y'
"             source Session.vim
"         endif
"     endif
" endfunction

" au VimEnter * call Startup()


" Edit vimr configuration file
nnoremap <leader>er :e $MYVIMRC<CR>
nnoremap <leader>el :so $MYVIMRC<CR>
nnoremap <leader>eL :lua require('ceres.functions').load()<CR>
nnoremap <leader>u :UndotreeShow<CR>


syntax on
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
set tabstop=4 softtabstop=2
set shiftwidth=4
set expandtab
set smartindent
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=120
set sessionoptions+=winpos,terminal

" load lua syntax in vim
let g:vimsyn_embed = 'lPr'


