-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {
    ui = {
        statusline = {
            separator_style = "arrow"
        }
    }
}

M.base46 = {
	theme = "rosepine",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}
M.mason.pkgs = {
  "black", "clangd", "clang-format", "pyright", "prettier"
}

return M