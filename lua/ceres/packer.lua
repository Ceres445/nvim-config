-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})



return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'ThePrimeagen/harpoon'
    use 'nvim-telescope/telescope-file-browser.nvim'


    -- treesitter

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'p00f/nvim-ts-rainbow'
    use { 'norcalli/nvim-colorizer.lua',

        config = function()
            require 'colorizer'.setup()
        end
    }
    use('nvim-treesitter/playground')

    -- lsp
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- LSP Support
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'onsails/lspkind.nvim' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
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
    use { "folke/neodev.nvim",
        config = function()
            require("neodev").setup()
        end }
    use { 'evanleck/vim-svelte',
        requires = {
            { 'othree/html5.vim' },
            { 'pangloss/vim-javascript' }
        }
    }
    --  Format, code help
    use 'psf/black'
    use 'prettier/vim-prettier'
    use 'github/copilot.vim'
    use 'ggandor/lightspeed.nvim'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-surround'
    -- use 'tpope/vim-commentary'
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { "ellisonleao/glow.nvim", config = function() require("glow").setup() end }
    --  colorschemes
    use 'gruvbox-community/gruvbox'
    use('folke/tokyonight.nvim', { branch = 'main' })
    use 'christianchiarulli/nvcode-color-schemes.vim'


    --  Git
    use 'tveskag/nvim-blame-line'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },

                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<ignore>'
                    end, { expr = true })

                    -- actions
                    map({ 'n', 'v' }, '<leader>hs', ':gitsigns stage_hunk<cr>')
                    map({ 'n', 'v' }, '<leader>hr', ':gitsigns reset_hunk<cr>')
                    map('n', '<leader>hs', gs.stage_buffer)
                    map('n', '<leader>hu', gs.undo_stage_hunk)
                    map('n', '<leader>hr', gs.reset_buffer)
                    map('n', '<leader>hp', gs.preview_hunk)
                    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                    map('n', '<leader>tb', gs.toggle_current_line_blame)
                    map('n', '<leader>hd', gs.diffthis)
                    map('n', '<leader>hd', function() gs.diffthis('~') end)
                    map('n', '<leader>td', gs.toggle_deleted)

                    -- text object
                    map({ 'o', 'x' }, 'ih', ':<c-u>gitsigns select_hunk<cr>')
                end
            }
        end
    }


    require('gitsigns').setup {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },

        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- navigation
            map('n', ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<ignore>'
            end, { expr = true })

            map('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<ignore>'
            end, { expr = true })

            -- actions
            map({ 'n', 'v' }, '<leader>hs', ':gitsigns stage_hunk<cr>')
            map({ 'n', 'v' }, '<leader>hr', ':gitsigns reset_hunk<cr>')
            map('n', '<leader>hs', gs.stage_buffer)
            map('n', '<leader>hu', gs.undo_stage_hunk)
            map('n', '<leader>hr', gs.reset_buffer)
            map('n', '<leader>hp', gs.preview_hunk)
            map('n', '<leader>hb', function() gs.blame_line { full = true } end)
            map('n', '<leader>tb', gs.toggle_current_line_blame)
            map('n', '<leader>hd', gs.diffthis)
            map('n', '<leader>hd', function() gs.diffthis('~') end)
            map('n', '<leader>td', gs.toggle_deleted)

            -- text object
            map({ 'o', 'x' }, 'ih', ':<c-u>gitsigns select_hunk<cr>')
        end
    }



    -- use 'airblade/vim-gitgutter'



    --  VIM extras
    use 'folke/todo-comments.nvim'
    use 'dstein64/vim-startuptime'
    use 'ThePrimeagen/vim-apm'
    use 'AckslD/nvim-neoclip.lua'
    use { 'akinsho/toggleterm.nvim',
        config = function()
            require("toggleterm").setup {
                -- size can be a number or function which is passed the current terminal
                size = 20,
                open_mapping = [[<c-t>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 1,     -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                persist_size = true,
                direction = 'float',
                close_on_exit = true, -- close the terminal window when the process exits
                shell = vim.o.shell,  -- change the default shell
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
        end }

    use 'mbbill/undotree'
    use 'folke/trouble.nvim'
    use 'ThePrimeagen/vim-be-good'
    use { 'folke/which-key.nvim',
        config = function()
            require('which-key').setup()
        end
    }
    use { 'rmagatti/auto-session',
        config = function()
            require('auto-session').setup {
                log_level = 'info',
                auto_session_suppress_dirs = { '~/' },
                auto_save_enabled = true,
                auto_restore_interval = true,
            }
        end
    }
    use 'rmagatti/session-lens'


    -- " dev icons
    use 'kyazdani42/nvim-web-devicons'

    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
end)
