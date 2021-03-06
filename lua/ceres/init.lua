require("ceres.lsp")
require("ceres.visuals")
require("ceres.telescope")
require("ceres.treesitter")
require("ceres.go")



-- require('gitsigns').setup()

require('auto-session').setup {
    log_level = 'info',
    auto_session_suppress_dirs = {'~/'},
    auto_save_enabled = true,
    auto_restore_interval = true,
}
-- Use ctrl-t to toggle terminal
require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    size = 20 ,
    open_mapping = [[<c-t>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction ='float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = "curved",
        -- width = <value>,
        -- height = <value>,
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

require('todo-comments').setup()
require('which-key').setup()
require( 'colorizer' ).setup()
