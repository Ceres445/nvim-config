---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "tokyonight",
	statusline = {
		---@diagnostic disable-next-line: assign-type-mismatch
		separator_style = "arrow",
	},
}
M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"

return M
