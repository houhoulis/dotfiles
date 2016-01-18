set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'rhysd/committia.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" Having trouble preventing startup warnings 'Ignoring [foo] because its extensions are not built.'
" Plugin 'malept/vim-flog'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set backupdir=/tmp
set directory=/tmp " Don't clutter my dirs up with swp and tmp files
set smarttab
" Use _ as a word-separator
set iskeyword-=_
" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal wrap
au BufNewFile,BufRead *.txt setlocal lbr
au BufNewFile,BufRead *.log setlocal wrap
au BufNewFile,BufRead *.log setlocal lbr
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
"CJH set list listchars=tab:Â»Â·,trail:Â·
set list listchars=tab:··,trail:·

" Numbers
set number
set numberwidth=5

" Get off Croaky's lawn
nnoremap <Left> :echoe "Use h "<CR>
nnoremap <Right> :echoe "Use l "<CR>
nnoremap <Up> :echoe "Use k "<CR>
nnoremap <Down> :echoe "Use j "<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set rulerformat=%15(%c%V\ %p%%%)
set incsearch     " do incremental searching - thanks http://www.moolenaar.net/habits.html
set hlsearch
set laststatus=2  " Always display the status line
" set paste         " Cmd-V paste text w/o autoformatting it " problem: this
" disables the line # and percent in status bar.

