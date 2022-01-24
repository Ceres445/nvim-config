" Copilot settings
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Black setup
" nnoremap <leader>F :Black<CR>
nnoremap <leader>F :lua require('ceres.functions').format()<CR>


" Vim fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gm :Git merge
nmap <leader>gc :Git checkout
nmap <leader>gsP :Git stash pop <CR>
nmap <leader>gsp :Git stash push <CR>
" TODO: use lua to do this, us vim input
nnoremap <leader>ga :lua require('ceres.functions').commit()<CR>
nnoremap <leader>gp :Git push<CR>
" Harpoon
nnoremap <leader>hm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hQ :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hq :lua require("telescope").extensions.harpoon.marks()<CR>

" Git commit with all

" Disable coc autocomplete
" autocmd FileType python :CocDisable
" Rainbow brackets
let g:rainbow_active = 1

" python syntax highlighting
let g:python_highlight_all = 1
" show hidden files in nerdtree
let NERDTreeShowHidden=1


" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

