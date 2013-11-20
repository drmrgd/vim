" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set nobackup	" Do not create a backup file

set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent "Smart indent
set autoindent "Auto indent
set number  "Show line numbers
set ls=2	"Always show the filename, etc.

" Source a global configuration file if available
" if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
" endif

""" Plugin Stuff """
" Add pathogen
execute pathogen#infect()
call pathogen#helptags()

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Some custom key mappings
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

" Add some custom syntax highlighting
function! Reloadsyn()
    syn  keyword myTodo DEBUG containedin=ALL
    hi def link myTodo Todo
endfunction
au BufEnter *.* call Reloadsyn()

" Color Scheme Stuff
syntax enable
set t_Co=256
set background=dark
"color ir_black
color molokai

" Run Perl syntax check
nmap <C-c><C-c> :!perl -Wc %

" Set '=' to run PerlTidy
set equalprg=perltidy

" Load up VIM powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2

" Add Stuff for gundo.vim
nmap <F5> :GundoToggle<CR>

" Key map for NERDTree
nmap <F4> :NERDTreeToggle<CR>

" Move around split windows a little more easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
