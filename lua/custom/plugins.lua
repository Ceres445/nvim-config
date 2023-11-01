local overrides = require("custom.configs.overrides")
local plugins = {
	{
		"tpope/vim-fugitive",
		lazy = false,
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
		opts = overrides.copilot,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",
				"python",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				-- "vue", "svelte",

				-- low level
				"c",
			},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			require("rainbow-delimiters.setup").setup({
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
			})
		end,
		lazy = false,
	},
	{

		"rmagatti/auto-session",

		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_enable_last_session = true,
				auto_session_enabled = true,
				auto_save_enabled = true,
				auto_restore_enabled = true,
				auto_session_suppress_dirs = nil,
				pre_save_cmds = { "tabdo NvimTreeClose" },
			})
		end,
		dependencies = "nvim-tree/nvim-tree.lua",

		lazy = false,
	},
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	lazy = false,
	-- 	-- config = require("lualine").setup(),
	-- },
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("mason-nvim-dap").setup()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("custom.configs.dap")
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
		opts = {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "copilot" },
			},
		},
	},
	-- {
	--   "jose-elias-alvarez/null-ls.nvim",
	--   event = "VeryLazy",
	--   opts = function()
	--     return require "custom.configs.null-ls"
	--   end,
	-- },
	{
		"mhartington/formatter.nvim",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.formatter")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("custom.configs.lint")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"eslint-lsp",
				"js-debug-adapter",
				"prettier",
				"typescript-language-server",
				"stylua",
				"black",
				"pyright",
				"clangd",
				"rust-analyzer",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
}

return plugins
