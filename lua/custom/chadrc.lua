---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",
	statusline = {
		---@diagnostic disable-next-line: assign-type-mismatch
		separator_style = "arrow",
	},
	theme_toggle = { "tokyonight", "catppuccin" },
	transparency = false,
}
M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"
-- M.options = {
-- 	user = function()
-- 		vim.opt.formatoptions:remove("cro")
-- 	end,
-- }

return M
