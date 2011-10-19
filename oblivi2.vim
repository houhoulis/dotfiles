" Vim color scheme
"
" Name: oblivi2.vim
" Author: Chris Houhoulis <chris@chrishouhoulis.com>
" License: same as vim
"
" A xterm-256colors -only theme originally adapted from the
" Oblivion theme in gEdit.
"

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "oblivi2"

hi Normal ctermfg=15 ctermbg=233
hi Cursor ctermfg=243 ctermbg=237
hi CursorLine ctermfg=196 ctermbg=248
hi LineNr ctermfg=238 ctermbg=16
hi Search ctermfg=16 ctermbg=249
hi Visual ctermbg=237

" Folds
" -----
" line used for closed folds
hi Folded ctermfg=230 ctermbg=238

" Misc
" ----
" directory names and other special names in listings
hi Directory ctermfg=149

" Popup Menu
" ----------
" normal item in popup
"hi Pmenu
" selected item in popup
"
"hi PmenuSel
" scrollbar in popup
"hi PMenuSbar
" thumb of the scrollbar in the popup
"hi PMenuThumb


"rubyComment
hi Comment ctermfg=239
hi link Todo Comment

"rubyPseudoVariable
"nil, self, symbols, etc
hi Constant ctermfg=134

"rubyClass, rubyModule, rubyDefine
"(CJHNO def, end,) include, etc
hi Define ctermfg=254 cterm=bold

"rubyInterpolation
hi Delimiter ctermfg=65

"rubyError, rubyInvalidVariable
hi Error ctermfg=255 ctermbg=124

"rubyFunction
hi Function ctermfg=69

"rubyIdentifier
"@var, @@var, $var, etc
"hi Identifier ctermfg=98
"hi link Identifier Constant
hi Identifier ctermfg=134

"rubyInclude
"include, autoload, extend, load, require
hi Include ctermfg=129

"rubyKeyword, rubyKeywordAsMethod
"alias, undef, super, yield, callcc, caller, lambda, proc
hi Keyword ctermfg=228

" same as define
hi link Macro Define

"rubyInteger
hi Number ctermfg=139

" #if, #else, #endif
hi link PreCondit Keyword
"

" generic preprocessor
hi PreProc ctermfg=173

" hi Special ctermfg=167

"rubyControl, rubyAccess, rubyEval
"case, begin, do, for, if unless, while, until else, etc.
hi link Statement Keyword
"

"rubyString
hi String ctermfg=245

hi Title ctermfg=226

"rubyConstant
hi Type ctermfg=113 cterm=bold

"hi rubyBlockParameter ctermfg=15
"hi rubyClass ctermfg=18
"hi rubyConstant ctermfg=167
"hi rubyInstanceVariable ctermfg=189
"hi rubyInterpolation ctermfg=107
"hi rubyLocalVariableOrMethod ctermfg=189
"hi rubyPredefinedConstant ctermfg=167
"hi rubyPseudoVariable ctermfg=221
"hi rubyStringDelimiter ctermfg=143
hi DiffAdd ctermbg=6 cterm=bold
hi DiffDelete ctermfg=12 ctermbg=4 cterm=bold

hi link htmlTag xmlTag
hi link htmlTagName xmlTagName
hi link htmlEndTag xmlEndTag

hi xmlTag ctermfg=181
hi xmlTagName ctermfg=181
hi xmlEndTag ctermfg=181
