local M = {}
M.general = {
	i = {
		["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		-- ["<C-j>"] = { 'copilot#Accept("<CR>")', opts = { silent = true, expr = true } },
	},
	n = {
		["<leader>v"] = { "ggVG", "select all text" },
	},
	v = {
		["<"] = { "<gv", "indent left" },
		[">"] = { ">gv", "indent right" },
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Run or continue the debugger",
		},
	},
}

M.fugitive = {
	n = {
		["<leader>gs"] = { "<cmd> Git <CR>", "Git status" },
		["<leader>gc"] = { "<cmd> Git commit <CR>", "Git commit" },
		["<leader>gp"] = { "<cmd> Git push <CR>", "Git push" },
		["<leader>gf"] = { "<cmd> diffget //2 <CR>", "Get left side change" },
		["<leader>gj"] = { "<cmd> diffget //3 <CR>", "Get right side change" },
	},
}
M.bufferline = {
	n = {
		["L"] = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"Goto next buffer",
		},
		["H"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"Goto prev buffer",
		},

		["<C-s>"] = {
			function()
				require("nvchad.tabufline").close_buffer()
			end,
			"Close buffer",
		},
	},
}

M.terminal = {
	n = {
		["<C-t>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Toggle floating term",
		},
	},
	t = {
		["<C-t>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Toggle floating term",
		},
	},
}

M.colorscheme = {
	n = {
		["<C-b>"] = {
			function()
				vim.o.background = "dark"
			end,
		},
		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"Toggle transparency in colorscheme",
		},
	},
}

M.telescope = {
	n = {
		["gr"] = { "<cmd> Telescope lsp_references <CR>", "LSP Reference" },
	},
}

return M
