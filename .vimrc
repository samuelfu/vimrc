set number

" Define plugins to install
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Browse the file system
Plug 'scrooloose/nerdtree'

" Ctrlp
Plug 'kien/ctrlp.vim'

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
call plug#end()

if (empty($TMUX))
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

let mapleader ="\<Space>"
" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Use arrow keys to navigate window splits
nnoremap <silent> <Right> :wincmd l <CR>
nnoremap <silent> <Left> :wincmd h <CR>
noremap <silent> <Up> :wincmd k <CR>
noremap <silent> <Down> :wincmd j <CR>

" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" Enter file search mode
nmap <leader>p :CtrlP<cr>

" Nerdtree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open and close file tree
map <C-n> :NERDTreeToggle<CR>

" open current buffer in file tree
nmap <leader>n :NERDTreeFind<CR>

let g:lightline = {
			\ 'colorscheme': 'onedark',
			\ }
let g:airline_theme='onedark'
let g:onedark_hide_endofbuffer=1

" Do not need on linux
let g:onedark_termcolors=16

" Optional
let g:jedi#completions_command = "<C-N>"
let g:jedi#popup_on_dot = 0
let g:vimtex_version_check = 0

syntax on
colorscheme onedark
set laststatus=2

" Optional on linux
hi comment ctermfg=grey
hi LineNr ctermfg=grey

