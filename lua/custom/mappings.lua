local M = {}
M.general = {
	i = { ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } } },
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

		["<C-w>"] = {
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
	},
}

return M
