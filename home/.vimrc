" Gotta be first
set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler " show cursor position all the time
set number " line numbers
set showcmd " display incomplete commands
set incsearch " do incremental searching
set hlsearch " switch on highlighting the last used search pattern
set history=1000 " keep 1000 lines of CLI history
set linebreak " wrap lines on 'word' boundaries
set scrolloff=3 " don't let the cursor touch the edge of the viewport
set splitright " vertical splits use right half of the screen
set timeoutlen=100 " lower ^[ timeout"
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop " use ~ to toggle case as an operator, not a motion
set mouse=a " enable the mouse
set clipboard=unnamed " Yank and paste using y and p in vim

" Tab settings
set expandtab " Expand tabs into spaces
set tabstop=2 " default to 2 spaces for a hard tab
set softtabstop=2 " default to 2 spaces for the soft tab
set shiftwidth=2 " for when <TAB> is pressed at the beginning of a line

" Alias sublime-settings to json so the syntax highlighting is correct
au! BufRead,BufNewFile *.sublime-settings setfiletype json

" --- Plugin-specific settings ---
" --- altercation/vim-colors-solarized settings ---
set background=dark
colorscheme twilight256

" --- bling/vim-airline settings ---
" Always show statusbar
set laststatus=2

" Fancy arrow symbols
let g:airline_powerline_fonts=1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled=1

" --- scrooloose/syntactic settings ---
let g:syntactic_error_symbol = '✘'
let g:syntactic_warning_symbol = "▲"
augroup mySyntactic
	au!
	au FileType tex let b:syntactic_mode = "passive"
augroup END

" --- airblade/vim-gitgutter settings ---
"  Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" --- Raimondi/delimitMate settings ---
let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- Remap the leader key to space ---
let mapleader = "\<Space>"

" --- Map <Leader>o to open a file, <Leader>w to save & <Leader>q to exit + save ---
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :x<CR>

" --- Print message upon navigating with arrow keys ---
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" --- Recommended 72 columns width for Git commit messages ---
autocmd Filetype gitcommit setlocal spell textwidth=72