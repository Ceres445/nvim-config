" Telescope shortcuts
nnoremap <leader>fF :lua require('telescope.builtin').find_files( {hidden=true, no_ignore=true})<CR>
nnoremap <leader>ff :lua require('ceres.telescope').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>bb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fs :lua require('session-lens').search_session()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({string = vim.fn.input("Grep for >")})<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fy :lua require('telescope').extensions.neoclip.default()<cr>
nnoremap <leader>gb :lua require('ceres.telescope').git_branches()<CR>
nnoremap <leader>gc :lua require('ceres.telescope').git_branches()<CR>
nnoremap <leader>vrc :lua require('ceres.telescope').search_dotfiles()<CR>
nnoremap <leader>vrf :lua require('ceres.telescope').grep_dotfiles()<CR>
nnoremap <leader>nrf :lua require('ceres.telescope').grep_config()<CR>
nnoremap <leader>wb :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>wc :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>fb :lua require('telescope').extensions.file_browser.file_browser()<CR>
nnoremap <leader>fB :lua require('telescope').extensions.file_browser.file_browser({path = "%:p:h"})<CR>

