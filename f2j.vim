" Vim syntax file
" Language:         f2j
" Maintainer:       Ningning Xie <xnningxie@gmail.org>
" Last Change:      2015 Mar 18

" For vim-version 5.x: Clear all syntax items
" For other vim-version : Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" (Qualified) identifiers (no default highlighting)
syn match ConId "\(\<\u[a-zA-Z0-9_']*\.\)\=\<\u[a-zA-Z0-9_']*\>"
syn match VarId "\(\<\u[a-zA-Z0-9_']*\.\)\=\<\l[a-zA-Z0-9_']*\>"

syn cluster f2jNotTop contains=f2jTodo,f2jInterpolation,f2jNoInterpolation,f2jStringEscape

" Keywords
syn keyword f2jBoolean          True False
syn keyword f2jConditional      if then else
syn keyword f2jStatement        case of \| let and rec
syn keyword f2jModule           module
syn keyword f2jStructure        data
syn keyword f2jTypedef          type
syn keyword f2jType             Int String Bool Char Float Double

" Infix operation
syn match   f2jVarSym           "\(\<\u[a-zA-Z0-9_']*\.\)\=[-!#$%&\*\+/<=>\?@\\^|~:.][-!#$%&\*\+/<=>\?@\\^|~:.]*"

" Strings and Constants
syn match   f2jInteger          "\<-\=\d\+\>"
syn match   f2jReal             "\<-\=\d\+\.\d*\([eE][-+]\=\d\+\)\=\>"
syn match   f2jCharacter        "'[^']'"
syn match   f2jCharacter        "'\\''"
syn match   f2jCharacter        "'[^\\]'"
syn region  f2jString           matchgroup=f2jDelimiter start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=f2jInterpolation, f2jNoInterpolation,f2jStringEscape

" String Interpolation

syn match   f2jStringEscape     "\\\\"                           contained
syn region  f2jInterpolation    matchgroup=f2jDelimiter start="\\{" end="}" contained contains=ALLBUT,@f2jNotTop
syn region  f2jNoInterpolation  start="\\\\{" end="}"            contained
syn match   f2jNoInterpolation  "\\\\{"                          contained

syn match   f2jDelimiter        "(\|)\|\[\|\]\|,\|;\|{\|}"

" Comments
syn region   f2jComment         start="--" end="$" contains=f2jTodo
syn region   f2jBlockComment    start="{-" end="-}" contains=f2jBlockComment, f2jTodo
syn keyword  f2jTodo            contained TODO FIXME XXX


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_f2j_syntax_inits")
  if version < 508
    let did_f2j_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink f2jModule                 f2jStructure
  HiLink f2jVarSym                 f2jOperator
  HiLink f2jStringEscape           f2jString
  HiLink f2jNoInterpolation        f2jString

  HiLink f2jConditional            Conditional
  HiLink f2jStatement              Statement
  HiLink f2jInteger                Number
  HiLink f2jReal                   Float
  HiLink f2jCharacter              Character
  HiLink f2jBoolean                Boolean
  HiLink f2jType                   Type
  HiLink f2jString                 String
  HiLink f2jComment                Comment
  HiLink f2jBlockComment           Comment
  HiLink f2jTodo                   Todo
  HiLink f2jStructure              Structure
  HiLink f2jOperator               Operator
  HiLink f2jTypedef                Typedef
  HiLink f2jDelimiter              Delimiter

  delcommand HiLink
endif

let b:current_syntax = "f2j"
