" set default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

syntax on
set number
set showmatch

set t_Co=256
colorscheme termschool

nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>i
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
nnoremap <F7> :make!<CR>

set nocompatible              " be iMproved, required 
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Clang Complete Setup
let g:clang_use_library=1
let g:clang_library_path='/usr/lib/'
let g:clang_complete_auto=1
let g:clang_hl_errors=1
set conceallevel=2
set concealcursor=inv
let g:clang_snippets=1
let g:clang_conceal_snippets=1 
let g:clang_snippets_engine='clang_complete'
set completeopt=menu,menuone
set pumheight=20
let g:clang_user_options='-std=c89'
let g:clang_complete_macros=1
let g:clang_complete_copen=1

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
inoremap <F3> <ESC>:SyntasticReset<CR>i
nnoremap <F3> :SyntasticReset<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Fugitive setup
set diffopt+=vertical
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
set splitbelow