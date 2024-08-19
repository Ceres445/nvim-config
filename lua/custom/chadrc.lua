---@type ChadrcConfig
local M = {}

-- TODO: Fix clipboard: https://github.com/NvChad/NvChad/discussions/1238

M.ui = {
	theme = "catppuccin",
	statusline = {
		---@diagnostic disable-next-line: assign-type-mismatch
		separator_style = "arrow",
	},
	theme_toggle = { "tokyonight", "catppuccin" },
	transparency = true,
}
M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"
-- M.options = {
-- 	user = function()
-- 		vim.opt.formatoptions:remove("cro")
-- 	end,
-- }

return M
