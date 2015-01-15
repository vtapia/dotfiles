set nocompatible
set paste

colorscheme railscasts

let mapleader=","

runtime autoload/pathogen.vim

execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
	exe 'source' fpath
endfor

