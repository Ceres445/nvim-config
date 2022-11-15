let t:is_transparent = 0

function! Toggle_transparent_background()
    if t:is_transparent == 0
        set background=dark
        let t:is_transparent = 1
        let g:tokyonight_transparent = 1
        let g:tokyonight_transparent_sidebar = 1
    else
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 0
        let g:tokyonight_transparent = 0
        let g:tokyonight_transparent_sidebar = 0
    endif
endfunction


let t:schemes = ['gruvbox', 'tokyonight', 'onedark']
let t:index = 1

function! Toggle_colorscheme()
    " if ShowColourSchemeName() == "onedark"
    "     colorscheme gruvbox
    "     let g:airline_theme = 'gruvbox'
    "     let t:is_scheme = 1
    " else
    "     let t:is_scheme =0
    "     colorscheme onedark
    "     let g:airline_theme = 'onedark'
    " hi TSNamespace guifg=#E06C75
    " endif
    " :AirlineRefresh
    execute  "colorscheme " . t:schemes[t:index]
    if t:schemes[t:index] == "onedark"
        hi TSNamespace guifg=#E06C75
    endif
    echo system("~/.tmux/load_theme.sh " .. " " .. t:schemes[t:index])
    if t:index == len(t:schemes) - 1
        let t:index = 0
    else
        let t:index = t:index + 1
    endif
    highlight CursorLineNr guifg=#E06C75
    highlight LineNrAbove guifg=#E5C07B
    highlight LineNrBelow guifg=#E5C07B
    highlight TSVariable guifg=#56B6C2
    if t:is_transparent  == 1
        let t:is_transparent = 0 
        call Toggle_transparent_background()
    else 
        let t:is_transparent = 1
        call Toggle_transparent_background()
    endif
endfunction

nnoremap <C-c><C-c> :call Toggle_transparent_background()<CR>
nnoremap <C-c><C-s> :call Toggle_colorscheme()<CR>
call Toggle_colorscheme()
" set laststatus=2
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

" " a little more informative version of the above
" nmap <Leader>sI :call SynStack()<CR>
" map <leader>ss :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" function! SynStack()
"     if !exists("*synstack")
"         return
"     endif
"     echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc
" for transparent background


" function! ShowColourSchemeName()
"     try
"         return g:colors_name
"     catch
"         return "default"
"     endtry
" endfunction
