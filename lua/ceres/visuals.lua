-- dev icons
require("nvim-web-devicons").setup {
    override = {
        zsh = { icon = "", color = "#428850", name = "Zsh" },
        lua = { icon = "", color = "#4E99DF", name = "Lua" },
        md = { icon = "", color = "#6BD02B", name = "Md" },
        [".gitignore"] = { icon = "", color = "#F14E32", name = "GitIgnore" },
    },
    default = true,
}

-- require('twilight').setup()

-- Set barbar's options
-- vim.g.bufferline = {
--     -- Enable/disable animations
--     animation = true,

--     -- Enable/disable auto-hiding the tab bar when there is a single buffer
--     auto_hide = false,

--     -- Enable/disable current/total tabpages indicator (top right corner)
--     tabpages = true,

--     -- Enable/disable close button
--     closable = true,

--     -- Enables/disable clickable tabs
--     --  - left-click: go to buffer
--     --  - middle-click: delete buffer
--     clickable = true,

--     -- Excludes buffers from the tabline
--     -- exclude_ft = {'javascript'},
--     -- exclude_name = {'package.json'},

--     -- Enable/disable icons
--     -- if set to 'numbers', will show buffer index in the tabline
--     -- if set to 'both', will show buffer index and icons in the tabline
--     icons = true,

--     -- If set, he icon color will follow its corresponding buffer
--     -- highlight group. By default, the Buffer*Icon group is linked to the
--     -- Buffer* group (see Highlighting below). Otherwise, it will take its
--     -- default value as defined by devicons.
--     icon_custom_colors = false,

--     -- Configure icons on the bufferline.
--     icon_separator_active = '▎',
--     icon_separator_inactive = '▎',
--     icon_close_tab = '',
--     icon_close_tab_modified = '●',
--     icon_pinned = '車',

--     -- If true, new buffers will be inserted at the start/end of the list.
--     -- Default is to insert after current buffer.
--     insert_at_end = false,
--     insert_at_start = false,

--     -- Sets the maximum padding width with which to surround each tab
--     maximum_padding = 1,

--     -- Sets the maximum buffer name length.
--     maximum_length = 30,

--     -- If set, the letters for each buffer in buffer-pick mode will be
--     -- assigned based on their name. Otherwise or in case all letters are
--     -- already assigned, the behavior is to assign letters in order of
--     -- usability (see order below)
--     semantic_letters = true,

--     -- New buffer letters are assigned in this order. This order is
--     -- optimal for the qwerty keyboard layout but might need adjustement
--     -- for other layouts.
--     letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

--     -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
--     -- where X is the buffer number. But only a static string is accepted here.
--     no_name_title = nil,
-- }

require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp",
        show_tab_indicators = true,
    }}

require('lualine').setup{
	sections = {lualine_c = {require('auto-session.lib').current_session_name}}
}

-- require'nvim-tree'.setup {
--     auto_close          = true,
--     open_on_tab         = false,
--     update_cwd = true,
--     update_focused_file = {
--         enable = false,
--         update_cwd = true
--     },
--     update_to_buf_dir   = {
--         enable = true,
--         auto_open = false,
--     },
-- }


-- auto pair brackets
local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    },
})

local ts_conds = require('nvim-autopairs.ts-conds')

local Rule = require('nvim-autopairs.rule')

-- press % => %% only while inside a comment or string
npairs.add_rules({
    Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({'string','comment'})),
    Rule("$", "$", "lua")
        :with_pair(ts_conds.is_not_ts_node({'function'}))
})
