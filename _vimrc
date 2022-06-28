syntax on
set nocompatible
set t_Co=256 " for some reason, Colors don't work if this option is not on 




 " Sets and Lets -------------------------------------------------{{{


" Seting the leader key to ','
let mapleader = ","

" Set the number of the line
set nu

" Adding the system clipboard 
set clipboard=unnamed

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

" Set logic to show tabs and white spaces
" exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
" set list

" Set the localleader to -
let maplocalleader = "-"

" Remaping : to ; and ; to :
nnoremap ; :
nnoremap : ;

" Disabling the stupid autocomment 
set formatoptions-=cro


"}}}

" Remaps ------------------------------------------------{{{
nnoremap <space> za





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
":nnoremap <M-c> :set cursorcolumn!<CR> 
:nnoremap <leader>c :set cursorcolumn!<CR> 
" Map the alt + h key to set the cursorline
":nnoremap <M-h> :set cursorline!<CR>
:nnoremap <leader>h :set cursorline!<CR>
" Pressing the letter o will open a new line bellow the current one


:nnoremap o o<esc>

" Pressing the letter O will inser a new line above the current one
:nnoremap O O<esc>

" New commands to move around in splites screens:
:nnoremap <c-j> <c-w>j
:nnoremap <c-k> <c-w>k
:nnoremap <c-h> <c-w>h
:nnoremap <c-l> <c-w>l


" turn off the highlight search with , + /
nnoremap <leader>/ :nohlsearch<CR>


" Open the VIMRC file pressing ,ev
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source the VIMRC file, so I don't need to open and close again
nnoremap <leader>sv :source $MYVIMRC<cr>




" Adding new logic to change the split view with ctrl + shift + j or k
"noremap <silent> <C-S-H> :vertical resize -5<CR>
"noremap <silent> <C-S-L> :vertical resize +5<CR>
noremap <silent> <C-Left> :vertical resize +1<CR>
noremap <silent> <C-Right> :vertical resize -1<CR>
noremap <silent> <C-Up> :horizontal resize +1<CR>
noremap <silent> <C-Down> :horizontal resize -1<CR>



" Command to toggle UndoTree!
noremap <leader>ut :UndotreeToggle<CR>


"}}}

" Custom functions --------------------------------------{{{

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
	
	execute ":w! " .. save_test_file
endfunction

:nnoremap <F6> :call SaveTests()<CR>

"}}}

" VIMSCRIPTS --------------------------------------------{{{

" This will enable code folding.

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


"}}}


" Abreviations-----------------------------------{{{








iabbrev @@ gui.bdaniel@gmail.com 
iabbrev ggui Guilherme Berwaldt Daniel



"}}}

" Plugins -----------------------------------------------{{{


call plug#begin('~/.vim/plugged')

	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-sensible'
	Plug 'kshenoy/vim-signature'
	Plug 'Rigellute/shades-of-purple.vim'
	Plug 'dracula/vim',{'as':'dracula'}
	Plug 'vimwiki/vimwiki'
	Plug 'dense-analysis/ale'
	Plug 'itchyny/lightline.vim'
	Plug 'machakann/vim-highlightedyank'
	Plug 'mbbill/undotree' 


call plug#end()



"}}}






"  Work computer specifics:----------------------------{{{

nnoremap <F12> :w<CR>:!python %<CR>



"" Open explorer where current file is located
"" Only for win for now.
func! File_manager() abort
    " Windows only for now
    if has("win32")
        if exists("b:netrw_curdir")
            let path = substitute(b:netrw_curdir, "/", "\\", "g")
        elseif expand("%:p") == ""
            let path = expand("%:p:h")
        else
            let path = expand("%:p")
        endif
        silent exe '!start explorer.exe /select,' .. path
    else
        echomsg "Not yet implemented!"
    endif
endfunc

nnoremap <silent> gof :call File_manager()<CR>






"  }}}


""+-- Light line color config ---------------- {{{
""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

set noshowmode
set laststatus=2



" if !has('gui_running')
"   set t_Co=256
" endif





""}}}


" Colors -------------------------------------------------{{{


":colorscheme molokai
":colorscheme shades_of_purple
 :colorscheme dracula




"}}}




" NerdTree logic and commands ---------------------------{{{
"autocmd VimEnter * NERDTree
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

noremap <C-N> :NERDTreeToggle<CR>

" Setting another directory as the starting point
cd D:\

"nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>





"autocmd FileChangedShellPost,SourcePre,SourceCmd,FocusGained,FocusLost,WinEnter,BufEnter,BufDelete,SessionLoadPost,FileChangedShellPost,GUIEnter * call lightline#update()
