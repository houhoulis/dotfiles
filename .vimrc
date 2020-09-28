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
"Plugin 'tpope/vim-eunuch'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-vinegar'
"Plugin 'tpope/vim-speeddating'
Plugin 'rhysd/committia.vim'
Plugin 'mattn/flappyvird-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'andys8/vim-elm-syntax'
Plugin 'dag/vim-fish'

" Plugin 'vim-scripts/TeTrIs.vim'
" Plugin 'vim-scripts/sokoban.vim'
"Plugin 'vim-scripts/YankRing.vim'
"Plugin 'vim-scripts/Gundo'
" Colors:
Plugin 'vim-scripts/oh-l-l'
Plugin 'vim-scripts/peaksea'
Plugin 'vim-scripts/darkspectrum'
Plugin 'vim-scripts/ScrollColors'
Plugin 'vim/killersheep'

Plugin 'masukomi/rainbow_parentheses.vim'

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

" exe "g:flog_enable"
" exe "g:rubycomplexity_enable_at_startup"
" sign define piet text=>> texthl=Search
" exe ":sign place 2 line=23 name=piet file=" . expand("%:p")

" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
let ruby_space_errors = 1

" https://github.com/masukomi/rainbow_parentheses.vim
augroup RainbowParentheses
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Color scheme inspired by gedit's oblivion colorscheme.
" Some of the chalkboard-style colorschemes are not high-contrast
" enough for reading outdoors.
" 256 colors only.
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme oblivi2
else
  if $TERM_PROGRAM == 'Apple_Terminal'
    colorscheme oblivi2
  else
    set t_Co=256
    " set term=rxvt-unicode
    set term=xterm
    colorscheme oblivi2
  endif
endif
" colorscheme mustanghcalves
colorscheme peaksea

set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set mouse=r       " it seems default is mouse=a, and it seems that prevents copying text with the mouse to
                  " copy into the system buffer. There are other ways to select text which might be more
		  " canonical though -- see other answers in this thread:
		  " https://unix.stackexchange.com/a/140584
set incsearch     " do incremental searching - thanks http://www.moolenaar.net/habits.html
set hlsearch

" Obviated by statusline:
" set rulerformat=%15(%c%V\ %p%%%)
set statusline=%<%f\ %n%h%m%r%=%-14.(%l,%c%V%)\ %p%%
set laststatus=2  " Always display the status line

" set paste         " Cmd-V paste text w/o autoformatting it " problem: this
" disables the line # and percent in status bar.

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" @masukomi
set nocopyindent
set nopreserveindent
set noautoindent

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
" Numbers
"set number
"set numberwidth=5
" Use _ as a word-separator
set iskeyword-=_
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Display extra whitespace
"CJH set list listchars=tab:Â»Â·,trail:Â·
set list listchars=tab:··,trail:·

" Local config
"if filereadable(".vimrc.local")
"  source .vimrc.local
"endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Tags
" I edit a lot of javascript, do I really want this?
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=.tags

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
" :Cuc my text (no quotes) -> runs cucumber scenarios containing "my text"
command! -nargs=+ Cuc :!ack --no-heading --no-break <q-args> | cut -d':' -f1,2 | xargs bundle exec cucumber --no-color

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" from Ben Orenstein (r00k). I should've been keeping track of who I
" stole stuff from.
" Center search matches when jumping
" map N Nzz
" map n nzz
set backupdir=~/.vim/temp
set directory=~/.vim/temp " Don't clutter my dirs up with swp and tmp files

" Get off Croaky's lawn
nnoremap <Left> :echoe "Use h "<CR>
nnoremap <Right> :echoe "Use l "<CR>
"nnoremap <Up> :echoe "Use k "<CR>
"nnoremap <Down> :echoe "Use j "<CR>

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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

