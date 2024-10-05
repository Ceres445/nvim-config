require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
o.shiftwidth = 4
o.splitbelow = false
o.splitright = true

-- local autocmd = vim.api.nvim_create_autocmd

-- autocmd("VimEnter", {
--   command = ":silent !kitty @ set-spacing padding=0 margin=0",
-- })
--
-- autocmd("VimLeavePre", {
--   command = ":silent !kitty @ set-spacing padding=20 margin=10",
-- })
