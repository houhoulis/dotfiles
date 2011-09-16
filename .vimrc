set nocompatible  " Use Vim settings, rather than Vi settings

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
  set nobackup
  set nowritebackup
" else
"   set backup
" endif

call pathogen#infect()
call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()

" Color scheme inspired by gedit's oblivion colorscheme.
" Some of the chalkboard-style colorschemes are not high-contrast
" enough for reading outdoors.
" 256 colors only.
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme oblivi2
else
  set t_Co=256
  " set term=rxvt-unicode
  set term=xterm
  colorscheme oblivi2
endif


set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set rulerformat=%15(%c%V\ %p%%%)
set noincsearch     " do NOT do incremental searching
set hlsearch
set laststatus=2  " Always display the status line

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
"need? inoremap <C-U> <C-G>u<C-U>
"
"
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

filetype plugin indent on

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

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
" :Cuc my text (no quotes) -> runs cucumber scenarios containing "my text"
command! -nargs=+ Cuc :!ack --no-heading --no-break <q-args> | cut -d':' -f1,2 | xargs bundle exec cucumber --no-color


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

" from Ben Orenstein (r00k). I should've been keeping track of who I
" stole stuff from.
" Center search matches when jumping
map N Nzz
map n nzz
set backupdir=~/temp
set directory=~/temp " Don't clutter my dirs up with swp and tmp files
set smarttab
" Use _ as a word-separator
set iskeyword-=_
" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal wrap
au BufNewFile,BufRead *.txt setlocal lbr
au BufNewFile,BufRead *.log setlocal wrap
au BufNewFile,BufRead *.log setlocal lbr

