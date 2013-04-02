" Set color scheme
colorscheme desert
" Set default font
if has('gui_running')
	set guifont=Monaco:h14
endif
" Make Vim more useful
set nocompatible
" Allow leaving modified buffers
set hidden
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set softtabstop=2
" Number of space characters for indenting
set shiftwidth=2
" Turn wrap words off
set nowrap
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
"Disable bell and window flash
set noerrorbells visualbell t_vb=
if has("autocmd")
  autocmd GUIEnter * set visualbell t_vb=
endif

" Project plugin settings
let g:proj_window_width=30

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

	" Spacing/tabs per filetype
	autocmd Filetype html setlocal et
	autocmd Filetype jade setlocal et
	autocmd Filetype css setlocal et
	autocmd Filetype less setlocal et
	autocmd Filetype javascript setlocal si ai
endif

" Snippet settings
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases["less"] = "css"
let g:snipMate.scope_aliases["jade"] = "html"

" Custom key bindings

" Map ALT-m to beginning of line at non-whitespace
set macmeta
map <M-m> ^

" Insert mode keys

" map CTRL-e to end-of-line
imap <C-e> <esc>$i<right>
" map CTRL-a to beginning-of-line
imap <C-a> <esc>0i
" map CTRL-f to next-character
imap <C-f> <esc>la
" map CTRL-b to previous-character
imap <C-b> <esc>ha
" map ALT-m to beginning of line at non-whitespace
imap <M-m> <esc>^i
" map ALT-f & ALT-b to next/previous-word
imap <M-f> <esc>lwi
imap <M-b> <esc>bi

" map CTRL-d to delete
imap <C-d> <delete>

" Pathogen (Install git repos in the ~/.vim/bundle path)
execute pathogen#infect()
filetype plugin indent on