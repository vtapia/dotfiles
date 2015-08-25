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

set history=700
set undolevels=700

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

syntax on
filetype plugin indent on

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
	exe 'source' fpath
endfor

