-- require("mini.sessions").setup({
-- 	autoread = true,
-- 	verbose = { read = true },
-- 	hooks = {
-- 		pre = {
-- 			write = function()
-- 				vim.cmd("NvimTreeClose")
-- 			end,
-- 		},
-- 	},
-- })
require("mini.visits").setup()
require("mini.fuzzy").setup()
