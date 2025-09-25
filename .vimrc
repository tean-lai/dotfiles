let mapleader = " "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'terryma/vim-multiple-cursors'
Plug 'folke/tokyonight.nvim'
Plug 'zenbones-theme/zenbones.nvim'
Plug 'preservim/nerdtree'
call plug#end()

set history=500

" enable filetype plugins
filetype plugin on
filetype indent on
set encoding=utf-8


set autoread
au FocusGained,BufEnter * silent! checktime  " not sure what this does

set nocompatible
set number relativenumber

" set hidden "not sure what this does
" set nowrap "do not wrap lines

map <leader>y "+y
map <leader>yy "+yy
map <leader>p "+p
map <leader>f :Goyo \| set linebreak<CR>
nnoremap <Space>t :NERDTreeToggle<CR>
nnoremap <Space>h :NERDTreeFocus<CR>
nnoremap <Space>l :NERDTreeClose<CR>
"nnoremap <Space>t :NERDTreeFind<CR> " find current tree

syntax enable
try
   "colorscheme desert
   colorscheme rosebones
catch
endtry

if executable('opam')
  let g:opamshare=substitute(system('opam var share'),'\n$','','''')
  if isdirectory(g:opamshare."/merlin/vim")
    execute "set rtp+=" . g:opamshare."/merlin/vim"
  endif
endif

" set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7 " i think this is like a veritcal buffer for scrolling


" turn on wild menu
" set wildmenu
" set wildignore=*.o,*~,*.pyc  " ignore compiled files
" set wildignore+=*/.git,*,*/.DS_STORE

set ruler " always show current position
set cmdheight=1  " height of command bar
set hid " buffer comes hidden when it is abandoned

set backspace=eol,start,indent " backspace acts as it should
set whichwrap+=<,>,h,l

set ignorecase " ignore case when searching
set smartcase " be smart about cases
set hlsearch incsearch

set lazyredraw " don't redraw while executing macros (good performance)
set magic " for regular expressions turn magic on
set showmatch " show matching brackets when text indicators is over them
set mat=2 " how many tenths of a second to blink

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a bit of extra margin to left
" set foldcolumn=1

set nobackup nowb noswapfile


set expandtab smarttab shiftwidth=2 tabstop=2


" Linebreak on 500 characters
set lbr
" set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Disable highlight when <leader><cr> is pressed
map <silent> <leader>q :noh<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Always show the status line
set laststatus=2



" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.vimrc,*.md,*.csv :call CleanExtraSpaces()
endif

" Run current file through interpreter. TODO: maybe update this to instead
" throw you into repl with everything loaded instead?
map <leader><CR> :call File_cmd()<cr>
function File_cmd()
  execute ':w'
  if expand('%:e') ==? 'py'
    exec ':! python3 %'
  elseif expand('%:e') ==? 'sh'
    exec ':!./%'
"  elseif expand('%:e') ==? 'cpp'
"    exec ':! make % && ./%'
  elseif expand('%:e') ==? 'ml'
    exec ':! ocaml %'
  endif
endfunction





