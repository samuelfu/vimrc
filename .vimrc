set number

call plug#begin('~/.vim/plugged')

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
let g:lightline = {
			\ 'colorscheme': 'onedark',
			\ }
let g:airline_theme='onedark'
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=16
let g:jedi#completions_command = "<C-N>"
let g:jedi#popup_on_dot = 0
let g:vimtex_version_check = 0
syntax on
colorscheme onedark
set laststatus=2
hi comment ctermfg=grey
hi LineNr ctermfg=grey

