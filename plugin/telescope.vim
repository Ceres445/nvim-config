" Telescope shortcuts
nnoremap <leader>fF :lua require('telescope.builtin').find_files( {hidden=true, no_ignore=true})<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({string = vim.fn.input("Grep for >")})<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fy :lua require('telescope').extensions.neoclip.default()<cr>
nnoremap <leader>gb :lua require('ceres.telescope').git_branches()<CR>
nnoremap <leader>gc :lua require('ceres.telescope').git_branches()<CR>
nnoremap <leader>vrc :lua require('ceres.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>vrf :lua require('ceres.telescope').grep_dotfiles({ hidden = true})<CR>
nnoremap <leader>wb :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>wc :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
