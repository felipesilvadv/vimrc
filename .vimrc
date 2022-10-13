filetype on
filetype plugin on
filetype indent on

syntax on

set number
set relativenumber
set cursorline

set clipboard=unnamed

set wildmenu
set wildmode=list:longest
set mouse=a
set softtabstop=4 tabstop=4 shiftwidth=4
set expandtab

set laststatus=2

set backspace=indent,eol,start

" netrw like NERDTree
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
let g:netrw_banner = 0

augroup AutoDeleteNetrwHiddenBuffers
	au!
    	au FileType netrw setlocal bufhidden=wipe statusline=\ 
augroup end

let g:kite_supported_languages = ['*']
let g:kite_tab_complete=1
autocmd BufReadPost * KiteShowPopularPatterns



" Add git branch to statusline


set statusline=
set statusline+=\[%{gitbranch#name()}\]
set statusline+=\ %f\ %y\ %m 
set statusline+=%=

" Kite
set statusline+=\ %{kite#statusline()}
" ALE lint status

function! LinterStatus()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total -  l:all_errors
    return l:counts.total == 0 ? 'OK' : printf('%d⨉ %d⚠ ', l:all_non_errors, l:all_errors)
endfunction

set statusline+=%=\ %{LinterStatus()}
" Count lines and character
set statusline+=\ %l:%c\ %02B

" Mappings
let mapleader = ","

" comments
augroup comment_like_a_boss
    autocmd!
    autocmd FileType c,cpp,go,javascript     let b:comment_leader = '// '
    autocmd FileType ruby,python,graphql     let b:comment_leader = '# '
    autocmd FileType conf,fstab,sh,bash,tmux let b:comment_leader = '# '
    autocmd FileType tex                     let b:comment_leader = '% '
    autocmd FileType vim                     let b:comment_leader = '" '
augroup END

noremap <silent> <leader>cc :<C-b>silent <C-e>norm ^i<C-r>=b:comment_leader<CR><CR>
noremap <silent> <leader>uc :<C-b>silent <C-e>norm ^xx<CR>


" Edit .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>epy :split $HOME/.vim/ftplugin/python.vim<cr>
nnoremap <leader>ejs :split $HOME/.vim/ftplugin/javascript.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Copy and paste

" vnoremap <leader>p <ESC>

" Search
nnoremap <leader>ag :sp<cr>:Ag<cr>
nnoremap <leader>rg :sp<cr>:Rg<cr>
nnoremap <leader>f :Rg<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>bf :Buffers<cr>


" Undo
" inoremap <leader>U <esc><C-r>i
" inoremap <leader>u <esc>ui

" Save 

" inoremap <C-S-S> <esc>:w<cr>

" netrw Toggle
" 
nnoremap <leader>t :Lexplore<cr>

" Move between widgets
nnoremap <leader>D <C-w>l
nnoremap <leader>A <C-w>h
nnoremap <leader>W <C-w>k
nnoremap <leader>S <C-w>j

" Change split
" to Vertical

nnoremap <leader>H <C-w>H

" to Horizontal
nnoremap <leader>h <C-w>K

" Fix indentation
nnoremap <leader>rf gg=G

" Python format json file
"
nnoremap <leader>pf :% !python -m json.tool<cr>

" ALE
"
"
nnoremap <leader>gtd :ALEGoToDefinition -split<cr>
nnoremap <leader>gd :ALEGoToDefinition<cr>
nnoremap <leader>fr :ALEFindReferences<cr>
nnoremap <leader>cb :cb<cr>
nnoremap <leader>nr :cn<cr>
nnoremap <leader>pr :cN<cr>

nnoremap <leader>n <Plug>(ale_next_error)
nnoremap <leader>N <Plug>(ale_previous_error)


" Go back to prev 
"
nnoremap <leader>i <C-i>
nnoremap <leader>o <C-o>

" Git fugitive
"
" git add current file
nnoremap <silent><leader>gaf :Git add %<cr>
" git add all
nnoremap <silent><leader>gaa :Git add .<cr>

" Git restore
"
" git restore staged current file
"
nnoremap <silent><leader>grf :Git restore --staged %<cr>
nnoremap <silent><leader>gra :Git restore --staged .<cr>


" Git commit 
"
" git commit amend
nnoremap <silent><leader>gca :Git commit --amend<cr>
" git commit with message
nnoremap <leader>gcm :Git commit -m '
" reset last commit
"
nnoremap <silent><leader>gcr :Git reset HEAD~<cr>

" Git push
"
nnoremap <silent><leader>gpf :Git push --force
nnoremap <silent><leader>gps :Git push


" vim-plug update
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS

call plug#begin()

Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'reactscript'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript', 'reactscript'] }
Plug 'mgechev/vim-jsx', { 'for': ['reactscript', 'javascript'] }
Plug 'vim-python/python-syntax', { 'for': ['python'] }
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()




