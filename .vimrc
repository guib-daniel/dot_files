syntax on

" Set the number of the line
set nu
" Map the alt + h key to set the cursorline
:nnoremap <M-h> :set cursorline!<CR>
" Map the relative line number to the F3 key
:nnoremap <F3> :set relativenumber!<CR>
" Map save file to F5 key in normal mode
:nnoremap <F5> :w!<CR>

" when in Insert mode, pressing F2 add the current path directory of the current buffer
:inoremap <F2> <C-R>=expand('%:p:h')<CR>

:inoremap <F3> <C-R>=strftime('%F')<CR>

" Yank from cursor to the end of the line
:nnoremap Y y$

" Adding map to set the collumn line
:nnoremap <M-c> :set cursorcolumn!<CR> 

" Pressing the letter o will open a new line bellow the current one
:nnoremap o o<esc>

" Pressing the letter O will inser a new line above the current one
:nnoremap O O<esc>

" New commands to move around in splites screens:
:nnoremap <c-j> <c-w>j
:nnoremap <c-k> <c-w>k
:nnoremap <c-h> <c-w>h
:nnoremap <c-l> <c-w>l


" Show partial command you type in the last line of the screen.
set showcmd

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history. Default number is 20
set history=1000

" Enalbe autocompletion menu after pressing TAB.
set wildmenu

" Make wildmenu behave similarly to Bash completion.
set wildmode=list:longest

" Wildmenu will ignore files with these extensions.
set wildignore=*docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Seting the leader key to ','
let mapleader = ","
" turn off the highlight search with , + /
nnoremap <leader>/ :nohlsearch<CR>







" Function to compare the contents of the contents of the register 'a' and register 'b'
let g:diffed_buffers = []

function DiffText(a, b, diffed_buffers)
    enew!
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:a, "\n"))
    diffthis
    vnew
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:b, "\n"))
    diffthis
endfunction

" mapping the compare between buffer 'a' and buffer 'b' to the F7 key
nnoremap <F7> :call DiffText(@a, @b, g:diffed_buffers)<CR>


:nnoremap <leader><F6> :call OpenTests()<CR>

" Testing a new function to create a new file and send it to the split window
function! OpenTests()
	let test_file=substitute(expand('%:r'), '$', "_test", "")
	
	execute "rightbelow vsplit " .. test_file
endfunction





" Testing a new function to create a new file and send it to the split window
function! SaveTests()
	let save_test_file=substitute(expand('%:r'), '$', "_test", "")
	
	execute ":e! " .. save_test_file
endfunction

:nnoremap <F6> :call SaveTests()<CR>
