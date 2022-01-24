let mapleader=" "

" remap jk and jj to esc
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>
autocmd TextChanged,TextChangedI <buffer> silent write
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>d "_d
vnoremap <leader>d "_d


nnoremap <leader>vv ggVG


vnoremap < <gv
vnoremap > >gv
noremap <leader>t :split<CR> :resize 10<CR> :term<CR> 
