" Copilot settings
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")


" Black setup
" nnoremap <leader>F :Black<CR>
nnoremap <leader>F :lua require('ceres.functions').format()<CR>


" Vim fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gm :Git merge
nmap <leader>gc :Git checkout
nmap <leader>gSP :Git stash pop <CR>
nmap <leader>gSp :Git stash push <CR>
nnoremap <leader>ga :lua require('ceres.functions').commit()<CR>
nnoremap <leader>gp :Git push<CR>

" Workflow using fugitive
" use gs to show status
" use s, u to stage and unstage
" use cc to commit
" use dv to resolve conflicts in vertical split
" use gf to grab left split
" use gj to grab right split



" Harpoon
nnoremap <leader>hm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hQ :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hq :lua require("telescope").extensions.harpoon.marks()<CR>


" Rainbow brackets
let g:rainbow_active = 1

" python syntax highlighting
let g:python_highlight_all = 1
let g:formatterpath = ['/usr/local/bin/black']
" if has('unix')
"     let g:python3_host_prog="/home/linuxbrew/.linuxbrew/bin/python3"
" else
"     let g:python3_host_prog="/usr/local/bin/python3"
" endif

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


" Commentary 
" autocmd Filetype svelte setlocal commentstring=<!--%s-->
