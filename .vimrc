set nocompatible

autocmd! bufwritepost .vimrc source %

set pastetoggle=<F2>
set clipboard=unnamed

colorscheme railscasts
" colorscheme wombat256mod

let mapleader=","

vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv

" set tw=79
" set nowrap
" set fo-=t
" set colorcolumn=80
" highlight ColorColumn ctermbg=233

set hlsearch
set history=700
set undolevels=700
set undofile
set undodir=~/tmp/vimundo
set backupdir=~/tmp/vimbkp

runtime autoload/pathogen.vim

execute pathogen#infect()
execute pathogen#helptags()

" Setting for vim-powerline
set laststatus=2

" pyflakes
let g:pyflakes_use_quickfix = 0

" flake8
noremap <Leader>8 :call Flake8()<CR>
autocmd BufWritePost *.py call Flake8()

" python completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Gundo
map <leader>g :GundoToggle<CR>

" ctags: fwd/bwd in tags stack
" map <M-Left> <C-T>
" map <M-Right> <C-]>

syntax on
filetype plugin indent on

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
	exe 'source' fpath
endfor

" Enable folding, but open unfolded
setlocal foldmethod=syntax
set foldlevelstart=99

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <Leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
