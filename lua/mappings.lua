require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

-- Buffers
map("n", "L", function()
    require("nvchad.tabufline").next()
end, { desc = "Goto next buffer" })
map("n", "H", function()
    require("nvchad.tabufline").prev()
end, { desc = "Goto prev buffer" })
map("n", "<C-s>", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "General close buffer" })

-- Git
map("n", "<leader>gs", "<cmd> Git <CR>", { desc = "Git status" })
map("n", "<leader>gp", "<cmd>Git push <CR>", { desc = "Git push" })
map("n", "<leader>gc", "<cmd>Git commit <CR>", { desc = "Git commit" })
map("n", "<leader>gj", "diffget //3 <CR>", { desc = "Get right side change" })
map("n", "<leader>gf", "diffget //2 <CR>", { desc = "Get left side change" })

map("n", "<C-t>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts = { border = "double" } } -- require("nvterm.terminal").toggle "float"
end, { desc = "Toggle floating term" })
map("t", "<C-t>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts = { border = "double" } }
end, { desc = "Toggle floating term" })

map("n", "<leader>tt", function()
    require("base46").toggle_transparency()
end)

map("n", "<leader>rh", function()
    require("gitsigns").reset_hunk()
end, { desc = "Git reset hunk" })

map("n", "<leader>rp", function()
    require("gitsigns").preview_hunk()
end, { desc = "Git preview hunk" })

map("n", "<leader>a", function()
    -- select all lines using ggVG
    vim.cmd "normal! ggVG"
end, { desc = "Select entire file" })

map("n", "<leader>dd", function()
    vim.cmd 'normal! "_dd'
end, { desc = "Delete into empty register" })

map("v", "<leader>d", function()
    vim.cmd 'normal! "_d'
end, { desc = "Delete into empty register" })


-- TODO: Add this
-- map("v", "<leader>c", function()
--     vim.cmd '"_c'
-- end, { desc = "Change into empty register" })

map("n", "x", '"_x', { desc = "Delete into blackhole register" })

-- map({ "n", "i", "v" }, "<C-st commit
-- >", "<cmd> w <cr>")
