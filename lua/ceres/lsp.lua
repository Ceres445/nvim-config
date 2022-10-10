require("trouble").setup {}
require("lsp_lines").setup()
vim.diagnostic.config({
    virtual_text = false,
})

vim.g.errors_visible = true
-- Setup nvim-cmp.

require("ceres.compe")


require("treesitter-context").setup()
