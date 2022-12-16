autocmd filetype cpp nnoremap <leader>R :!g++ -g % -o %:r  <CR>
autocmd filetype cpp nnoremap <leader>r :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

" autocmd BufNewFile  *.cpp 0r ~/.dotfiles/nvim/plugin/template.cpp

autocmd filetype cpp nnoremap <leader>M :read ~/.config/nvim/plugin/template.cpp<CR>81Gi
