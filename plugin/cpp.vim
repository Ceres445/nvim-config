autocmd filetype cpp nnoremap <leader>R :!g++ -g % -o %:r  <CR>
autocmd filetype cpp nnoremap <leader>r :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

" autocmd BufNewFile  *.cpp 0r ~/.dotfiles/nvim/plugin/template.cpp

autocmd filetype cpp nnoremap <leader>M :read ~/.config/nvim/plugin/template.cpp<CR>81Gi


autocmd filetype c nnoremap <leader>R :call CompileAndRun() <CR>
autocmd filetype c nnoremap <C-w><C-o> :call CloseIOBuffers() <CR>
autocmd filetype c nnoremap <leader>o :call IOBufferSetup() <CR>

let s:opened = 0
" setup input/output buffers on the right side for python,cpp,c
func! IOBufferSetup()
	let s:opened = 1

	let s:workingWindow=winnr()
	let s:workingFileName=@%
	let s:workingFileType=&filetype


	vsplit input.file
	execute(":w")
    " exe "wincmd r"

	" Save the input window
	let s:inputWindow=winnr()

	vertical resize 60
	split output.file

	" Go back to the input window
	exe s:inputWindow . "wincmd w"
endfunc

func! CloseIOBuffers()
	let s:opened = 0
	exe s:workingWindow . "wincmd w"
	execute(":on")
endfunc

" Compile&Run/Run for python,cpp,c
func! CompileAndRun()
	if s:opened == 0
		let s:workingFileName=@%
		let s:workingFileType=&filetype

		if !(s:workingFileType ==? "masm")
			execute('!echo "" > input.file')
		endif
	endif

	if s:workingFileType ==? "python"
		execute("!cat input.file | python3 ". s:workingFileName ." > output.file")
	elseif s:workingFileType ==? "cpp"
		" g++ test.cpp -o test.cpp.out &&  ./test.cpp.out < input.file > output.file
		execute("! g++ -std=c++17 ". s:workingFileName ." -o ". s:workingFileName .".out 2>output.file &&  ./". s:workingFileName .".out< input.file >> output.file")
	elseif s:workingFileType ==? "c"
		execute("! gcc ". s:workingFileName ." -o ". s:workingFileName .".out &&  ./". s:workingFileName .".out< input.file > output.file")
	elseif s:workingFileType ==? "masm"
		let choice = confirm("Choose mode: ", "&1normal\n &2debugx")
		if choice == 0
			echo "aborted"
		elseif choice == 1
			execute("!masm ". s:workingFileName)
		elseif choice == 2
			execute("!masm ". s:workingFileName . " debugx")
		endif
	elseif s:workingFileType ==? "tex"
		" execute("! xelatex main.tex && open main.pdf")
		"

		execute("! xelatex ". s:workingFileName . " && open ". s:workingFileName[:-5] .".pdf && osascript -e 'tell application \"System Events\" to key code 48 using command down'")
	endif
	if s:opened == 0 && !(s:workingFileType ==? "masm") && !(s:workingFileType ==? "tex")
		execute("call IOBufferSetup()")
		let s:opened = 1
	endif
endfunc
