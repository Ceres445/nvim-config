local M = {
	filetype = {
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		c = {
			require("formatter.filetypes.c").clang_format,
		},
		cpp = {
			require("formatter.filetypes.cpp").clang_format,
		},
		java = {
			require("formatter.filetypes.java").google_java_format,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = "FormatWriteLock",
})

return M
