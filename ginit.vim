" ginit.vim for nvim-qt
" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont Hack:h16:l
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv


let s:fontsize = 16
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Hack:h" . s:fontsize . ":l"
endfunction

function! FixFontSize(size)
  let s:fontsize = a:size
  :execute "GuiFont! Hack:h" . s:fontsize . ":l"
endfunction

noremap <C-+> :call AdjustFontSize(1)<CR>
noremap <C--> :call AdjustFontSize(-1)<CR>
noremap <C-=> :call FixFontSize(16)<CR>
inoremap <C-+> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C--> <Esc>:call AdjustFontSize(-1)<CR>a
inoremap <C-=> :call FixFontSize(16)<CR>

" fix shift insert
inoremap <silent>  <S-Insert>  <C-R>+
