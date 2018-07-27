" Author: Andrew Dean
" Description: Personal vimrc setup

"------------------------------------------------------------
" Initial setup {{{1
" Anything that should be set first goes here

" Ward off unexpected things that the distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

"------------------------------------------------------------
" Plugins {{{1
" Using vim-plug to manage plugins, with auto-install from vimrc
"

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install individual plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'sentientmachine/pretty-vim-python'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }"
call plug#end()

"------------------------------------------------------------
" Functionality {{{1
"
" How does vim 'work'

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Allow easier switching between files.
" Re-use the same window and switch from an unsaved buffer without saving
" Keep an undo history for multiple files when re-using the same window
set hidden

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Ensure unix formatting
set encoding=utf-8

" Faster operation
set ttyfast

" Make undo files for future edits
set undofile

" Remember vim command history past default
set history=1000

"------------------------------------------------------------
" User Interface {{{1
"
" Everything involving appearance in vim editor

" Display a menu when tabbing vim commands
set wildmenu

" Make wildmenu behave as unix does
set wildmode=list:longest

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

" Display line numbers on the left
set number

" Use all 256 colors in vim
" Must set this before colorscheme
let t_co=256

" Make a column at 80th position
set colorcolumn=80

" Allow text wrapping
set wrap

" Wrap at column
set textwidth=79

" Show which line currently editing
set cursorline

" Show matching parenthesis
set showmatch

" Change color of line numbers
highlight LineNr ctermfg=white

" Only redraw when we have to
set lazyredraw

" Display x lines above and below cursor when possible
set scrolloff=3

" Change line numbering to show what's relative
set relativenumber

" Show invisibles
set list

" Set invisibles to show
set listchars=tab:▸\

" Give terminal a title
set title

" Fold via indents
set foldmethod=indent

" Don't automatically fold the file upon opening it
set nofoldenable

" Sets folds at 2nd level for opening
set foldlevel=2

" Set the max amount of folds witin a fold
set foldnestmax=10

"------------------------------------------------------------
" Usability/Editing {{{1
"
" How editing works

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Enable use of the mouse for all modes
set mouse=a

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Disable automatic comment insertion (needs separation b/c it's a string)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4

" 4 spaces per tab while editing
set softtabstop=4

" Tabs translate to spaces
set expandtab

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Use jk for escaping in insert instead of escape key
inoremap jk <esc>

" Change leader from \ to , for comfort
let mapleader=","

" Unbind arrow keys
inoremap <Up> <Nop>
noremap <Up> <Nop>
xnoremap <Up> <Nop>
inoremap <Down> <Nop>
noremap <Down> <Nop>
xnoremap <Down> <Nop>
inoremap <Left> <Nop>
noremap <Left> <Nop>
xnoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Right> <Nop>
xnoremap <Right> <Nop>

" Clear highlights
nnoremap <Leader><space> :noh<cr>

" Fix regex patterns in vim
" nnoremap / /\v
" vnoremap / /\v

" Remove trailing whitespace
" nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"------------------------------------------------------------"
" Plugin Settings
"
" Place these settings at END OF FILE

" Toggle NERDTree by default
autocmd VimEnter * NERDTree

" Start cursor at file buffer instead of tree
autocmd VimEnter * wincmd p

" Toggle TagBar by default for files that support it (must have .FILETYPE)
autocmd VimEnter * nested : call tagbar#autoopen(1)

" Set airline theme
autocmd VimEnter * AirlineTheme deus

" Disable the need for 'a' when closing last buffer if nerdtree toggled
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

" No folding from vim-markdown
let g:vim_markdown_folding_disabled = 1

" Set colorscheme to monokai
colorscheme molokai

