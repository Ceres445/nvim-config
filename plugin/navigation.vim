nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
nnoremap <leader>k :lnext<CR>
nnoremap <leader>j :lprev<CR>

" nnoremap <leader>K :lua require("trouble").next({jump = true})<CR>
" nnoremap <leader>J :lua require("trouble").previous({jump = true})<CR>


nnoremap <C-q> <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>q <cmd>TroubleToggle loclist<cr>





nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <leader>L :blast<CR>
nnoremap <leader>H :bfirst<CR>
nnoremap <C-s> :bd<CR>
nnoremap <leader>bd :bd<CR>


" barbar maps
" nnoremap <silent> <S-h> :BufferPrevious<CR>
" nnoremap <silent> <S-l> :BufferNext<CR>
" nnoremap <leader>bp :BufferPin<CR>
" nnoremap <leader>bb :BufferOrderByBufferNumber<CR>
" nnoremap <leader>bf :BufferPick<CR>

" bufferline maps
nnoremap <silent> <S-h> :BufferLineCyclePrev<CR>
nnoremap <silent> <S-l> :BufferLineCycleNext<CR>

" use E instead of ^ to move to start of line
noremap ge g^
nmap gl g_


" quick change between buffers
nmap <C-e> <C-^>

" nvim tree setup
" let g:nvim_tree_respect_buf_cwd = 1
" let g:nvim_tree_window_picker_exclude = {
"             \   'filetype': [
"                 \     'notify',
"                 \     'packer',
"                 \     'qf'
"                 \   ],
"                 \   'buftype': [
"                     \     'terminal'
"                     \   ]
"                     \ }
" let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
" let g:nvim_tree_icons = {
"             \ 'default': '',
"             \ 'symlink': '',
"             \ 'git': {
"                 \   'unstaged': "✗",
"                 \   'staged': "✓",
"                 \   'unmerged': "",
"                 \   'renamed': "➜",
"                 \   'untracked': "★",
"                 \   'deleted': "",
"                 \   'ignored': "◌"
"                 \   },
"                 \ 'folder': {
"                     \   'arrow_open': "",
"                     \   'arrow_closed': "",
"                     \   'default': "",
"                     \   'open': "",
"                     \   'empty': "",
"                     \   'empty_open': "",
"                     \   'symlink': "",
"                     \   'symlink_open': "",
"                     \   }
"                     \ }

" nnoremap <C-n> :lua require('ceres.functions').tree.toggle(false)<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :lua require('ceres.functions').tree.open(true)<CR>
