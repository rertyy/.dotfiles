" Load the relevant plugins and indentation rules based on file types
filetype plugin indent on

" Turn on syntax highlighting
syntax on
" Make vim behaves less like vi
set nocompatible

""" Editing
" Automatically indent the new line
set autoindent
" Indent the new line according to C-like syntax
set smartindent
" Make default indent at 2 spaces
set shiftwidth=2
" Set tab stop to 2
set tabstop=2
set smarttab
" Replace all tab with spaces
set expandtab
" Allow backspace over lines
set backspace=indent,eol,start

"""" UI
" Display lines longer than the current window on the next line(s)
set wrap
" Prevent breaking a word into multiple lines when wrapping
set linebreak
" Display line and column number on the lower-right corner.
set ruler
" Get autocomplete when pressing tab
set wildmenu
set wildmode=list:longest
" Show operator pending
set showcmd
" Always show statusline
set laststatus=2
" Change default split behaviour
set splitbelow
set splitright
" Scrolloff
set scrolloff=1


"""" GUI
" Enable 24-bit colors
set termguicolors
" Use molokai as default color scheme
try
  color molokai
catch
endtry

" To get around problem with seemingly random characters appear in certain
" teminals.
set t_RV=
set t_u7=

" uncomment to turn on line number
set number
set relativenumber

" vim is optimized for keyboard-only, but if you insist on using mouse,
" uncomment the following
" set mouse+=a

" Switch between buffers without saving
" set hidden

" set confirm
" set visualbell

"=, For students who are used to using the psvm/sout/sop abbreviation, you can
" uncomment the following.
abbr psvm public static void main(String[] args){<CR>}<esc>O
abbr sout System.out.println("");<esc>2hi
abbr sop System.out.print("");<esc>2hi
abbr souf System.out.printf("");<esc>2hi

" Don't redraw on macros
set lazyredraw

" Keep a backup copy of the file being edited
set backup
set backupdir=~/.vim/files/backup

" Save undo history
set undofile
set undodir=$HOME/.vim/files/undo/

" Search options
set incsearch
set wrapscan
set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <esc> :nohl<cr><esc>

" Use system clipboard
set clipboard^=unnamed,unnamedplus


" Always report changes (default 2)
" set report=0



"""""""" Keymaps

" Saner yank
nnoremap Y y$

" Autocomplete bracket pairs
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" Switch windows quickly
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap for wordwrap
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Move lines
" "nnoremap <Esc>h <<
" "nnoremap <Esc>l >>
"  nnoremap <Esc>j ddp
" nnoremap <Esc>k kddpk
" "nnoremap <Esc>j :m .+1<CR>
" "nnoremap <Esc>k :m .-2<CR>

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

" Resize window
nnoremap <C-Left> <C-w>3<
nnoremap <C-Right> <C-w>3>
nnoremap <C-Up> <C-w>2+
nnoremap <C-Down> <C-w>2-

" Change tabs
nnoremap H gT
nnoremap L gt


let mapleader = " " " map leader to Space
map <leader>w :w<CR>

nnoremap <leader>\ :source $MYVIMRC<CR>


""""""" Autocommands
" restore cursor to last position in file:
autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif


fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif



""""""""""""" Statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#Normal#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

