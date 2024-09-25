require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("n", "L", function ()
				require("nvchad.tabufline").next()
end, { desc = "Goto next buffer"})
map("n", "H", function ()
				require("nvchad.tabufline").prev()
end, { desc = "Goto prev buffer"})
map("n", "<C-s>", function ()
				require("nvchad.tabufline").close_buffer()
end, { desc = "General close buffer"})



-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
