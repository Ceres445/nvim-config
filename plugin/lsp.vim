let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gs :lua vim.lsp.buf.signature_help()<CR>
nnoremap grn :lua vim.lsp.buf.rename()<CR>
nnoremap grr <cmd>TroubleToggle lsp_references<cr>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>vl :lua vim.diagnostic.setloclist({open  = false})<CR>
noremap <leader>vq :lua vim.diagnostic.setqflist({open = false})<CR>
nnoremap <leader>va <cmd>TroubleToggle<cr>
nnoremap <leader>vw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>vd <cmd>TroubleToggle document_diagnostics<cr>

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.luasnip = v:true
