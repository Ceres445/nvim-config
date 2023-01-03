
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'ThePrimeagen/harpoon'
    use 'nvim-telescope/telescope-file-browser.nvim'


    -- treesitter

    use ('nvim-treesitter/nvim-treesitter', { run= ':TSUpdate' })
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'p00f/nvim-ts-rainbow'
    use{  'norcalli/nvim-colorizer.lua' ,

        config = function()
            require'colorizer'.setup()
        end
    }
    use('nvim-treesitter/playground')

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use{  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = function()
            require('lsp_lines').setup()
        end,
    }

    -- status bar

    --  use 'romgrk/barbar.nvim'
    use 'akinsho/bufferline.nvim'
    use 'nvim-lualine/lualine.nvim'

    --  Languages

    use 'vim-python/python-syntax'
    use 'rust-lang/rust.vim'


    --  Format, code help
    use 'vim-autoformat/vim-autoformat'
    use 'psf/black'
    use 'prettier/vim-prettier'
    use 'github/copilot.vim'
    use 'ggandor/lightspeed.nvim'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'

    --  colorschemes
    use 'gruvbox-community/gruvbox'
    use ('folke/tokyonight.nvim', { branch =  'main' })
    use 'christianchiarulli/nvcode-color-schemes.vim'


    --  Git
    use 'ThePrimeagen/git-worktree.nvim'
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'airblade/vim-gitgutter'


    --  VIM extras
    use 'folke/todo-comments.nvim'
    use 'dstein64/vim-startuptime'
    use 'ThePrimeagen/vim-apm'
    use 'AckslD/nvim-neoclip.lua'
    use{  'akinsho/toggleterm.nvim' ,
        config = function ()
            require("toggleterm").setup{
                -- size can be a number or function which is passed the current terminal
                size = 20 ,
                open_mapping = [[<c-t>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                persist_size = true,
                direction ='float',
                close_on_exit = true, -- close the terminal window when the process exits
                shell = vim.o.shell, -- change the default shell
                -- this field is only relevant if direction is set to 'float'
                float_opts = {
                    -- the border key is *almost* the same as 'nvim_win_open'
                    -- see :h nvim_win_open for details on borders however
                    -- the 'curved' border is a custom border type
                    -- not natively supported but implemented in this plugin.
                    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                    border = "curved",
                    -- width = <value>,
                    -- height = <value>,
                    winblend = 0,
                    highlights = {
                        border = "normal",
                        background = "normal",
                    },
                },
            }

        end}
    use 'mbbill/undotree'
    use 'folke/trouble.nvim'
    use 'ThePrimeagen/vim-be-good'
    use{  'folke/which-key.nvim',
        config = function ()
            require('which-key').setup()
        end
    }
    use{  'rmagatti/auto-session',
        config = function()
            require('auto-session').setup {
                log_level = 'info',
                auto_session_suppress_dirs = {'~/'},
                auto_save_enabled = true,
                auto_restore_interval = true,
            }
        end
    }
    use 'rmagatti/session-lens'


    -- " dev icons
    use 'kyazdani42/nvim-web-devicons'
end)
