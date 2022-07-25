-- Copied from primeageq
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_ignore_patterns = { 'venv', 'node_modules', '__pycache__', 'target'},
        prompt_prefix = " >",
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require'neoclip'.setup()
require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
    },
})

require("git-worktree").setup({
    update_on_change =  true,
})

require('session-lens').setup {
    path_display={'shorten'},
}

telescope.load_extension("git_worktree")
telescope.load_extension('harpoon')
telescope.load_extension("fzy_native")
telescope.load_extension("session-lens")
telescope.load_extension("file_browser")

local M = {}
M.search_dotfiles = function()
    builtin.find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end


M.git_branches = function()
    print(os.execute("git rev-parse --is-bare-repository > /dev/null 2>&1"))
    if os.execute("git rev-parse --is-bare-repository > /dev/null 2>&1") == 0 then
        builtin.git_branches({
            attach_mappings = function(_, map)
                map("i", "<c-d>", actions.git_delete_branch)
                map("n", "<c-d>", actions.git_delete_branch)
                return true
            end,
        })
    else
        telescope.extensions.git_worktree.git_worktrees()
    end
end

M.grep_dotfiles = function()
    builtin.live_grep({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

M.find_files = function()
    builtin.find_files()
end

return M
