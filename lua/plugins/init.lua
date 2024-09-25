return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "c",
                "python",
                "cpp",
            },
        },
    },

    {
        "zbirenbaum/copilot.lua",
        -- Lazy load when event occurs. Events are triggered
        -- as mentioned in:
        -- https://vi.stackexchange.com/a/4495/20389
        event = "InsertEnter",

        -- You can also have it load at immediately at
        -- startup by commenting above and uncommenting below:
        -- lazy = false
        opts = {

            -- Possible configurable fields can be found on:
            -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
            suggestion = {
                enabled = false,
            },
            panel = {
                enabled = false,
            },
            -- panel = {
            -- 	keymap = {
            -- 		accept = "<C-j>",
            -- 	},
            -- },
        },
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            local rainbow_delimiters = require "rainbow-delimiters"
            require("rainbow-delimiters.setup").setup {
                strategy = {
                    [""] = rainbow_delimiters.strategy["global"],
                    vim = rainbow_delimiters.strategy["local"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                },
                highlight = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            }
        end,
        lazy = false,
    },

    {
        "echasnovski/mini.nvim",
        version = "*",
        lazy = false,
        config = function()
            require "plugins.mini"
        end,
    },

    {
        "rmagatti/auto-session",
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            -- log_level = 'debug',
        },
    },
}
