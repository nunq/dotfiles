" Vim color file
"
" Author: Patrick Stockwell <mail@deciphr.net>

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'vim-monokai-tasty'

" User Options --- {{{
if !exists('g:vim_monokai_tasty_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:vim_monokai_tasty_italic = 1
  else
    let g:vim_monokai_tasty_italic = 0
  endif
endif
" }}}

if g:vim_monokai_tasty_italic
  let s:italic = { 'cterm': 'italic', 'gui': 'italic' }
else
  let s:italic = { 'cterm': 'NONE', 'gui': 'NONE' }
endif

let s:yellow = { 'cterm': 228, 'gui': '#ffff87' }
let s:purple = { 'cterm': 141, 'gui': '#af87ff' }
let s:light_green = { 'cterm': 148, 'gui': '#A4E400' }
let s:light_blue = { 'cterm': 81, 'gui': '#62D8F1' }
let s:magenta = { 'cterm': 197, 'gui': '#FC1A70' }
let s:orange = { 'cterm': 208, 'gui': '#FF9700' }

" Search colours. Specifically not in the monokai palette so that they will
" stand out.
let s:black = { 'cterm': 0, 'gui': '#000000' }
let s:bright_yellow = { 'cterm': 11, 'gui': 'yellow' }

" Monochrome in order light -> dark
let s:white = { 'cterm': 231, 'gui': '#ffffff' }
let s:light_grey = { 'cterm': 250, 'gui': '#bcbcbc' }
let s:grey = { 'cterm': 245, 'gui': '#8a8a8a' }
let s:dark_grey = { 'cterm': 59, 'gui': '#5f5f5f' }
let s:darker_grey = { 'cterm': 238, 'gui': '#444444' }
let s:light_charcoal = { 'cterm': 238, 'gui': '#2b2b2b' }
let s:charcoal = { 'cterm': 235, 'gui': '#262626' }

" Git diff colours.
let s:danger = { 'cterm': 197, 'gui': '#ff005f' }
let s:olive = { 'cterm': 64, 'gui': '#5f8700' }
let s:dark_red = { 'cterm': 88, 'gui': '#870000' }
let s:blood_red = { 'cterm': 52, 'gui': '#5f0000' }
let s:dark_green = { 'cterm': 22, 'gui': '#005f00' }
let s:bright_blue = { 'cterm': 33, 'gui': '#0087ff' }
let s:purple_slate = { 'cterm': 60, 'gui': '#5f5f87' }

let s:none = { 'cterm': 'NONE', 'gui': 'NONE' }
let s:bold = { 'cterm': 'bold', 'gui': 'bold' }
let s:underline = { 'cterm': 'underline', 'gui': 'underline' }
let s:bold_underline = { 'cterm': 'bold,underline', 'gui': 'bold,underline' }

function! Highlight(group, colour)
  let l:foreground = exists('a:colour.fg')
        \ ? ' ctermfg=' . a:colour.fg.cterm . ' guifg=' . a:colour.fg.gui
        \ : ''
  let l:background = exists('a:colour.bg')
        \ ? ' ctermbg=' . a:colour.bg.cterm . ' guibg=' . a:colour.bg.gui
        \ : ''
  let l:style = exists('a:colour.style')
        \ ? ' cterm=' . a:colour.style.cterm . ' gui=' . a:colour.style.gui
        \ : ''
  let l:highlight_command = 'hi '
        \ . a:group . l:foreground . l:background . l:style
  exec l:highlight_command
endfunction

call Highlight('Normal', { 'fg': s:white, 'bg': s:charcoal, 'style': s:none })
call Highlight('Cursor', { 'fg': s:charcoal, 'bg': s:light_blue, 'style': s:none })
call Highlight('Special', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Title', { 'fg': s:white, 'bg': s:none, 'style': s:bold })

call Highlight('Error', { 'fg': s:white, 'bg': s:danger, 'style': s:none })
call Highlight('ErrorMsg', { 'fg': s:white, 'bg': s:danger, 'style': s:none })
call Highlight('WarningMsg', { 'fg': s:white, 'bg': s:danger, 'style': s:none })
call Highlight('SpellBad', { 'fg': s:white, 'bg': s:danger, 'style': s:none })
call Highlight('SpellRare', { 'fg': s:white, 'bg': s:danger, 'style': s:none })
call Highlight('SpellCap', { 'fg': s:charcoal, 'bg': s:orange, 'style': s:italic })
call Highlight('SpellLocal', { 'fg': s:charcoal, 'bg': s:orange, 'style': s:italic })

call Highlight('CursorLineNR', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })

call Highlight('CursorColumn', { 'fg': s:none, 'bg': s:darker_grey, 'style': s:none })
call Highlight('ColorColumn', { 'fg': s:none, 'bg': s:light_charcoal, 'style': s:none })
call Highlight('Conceal', { 'fg': s:none, 'bg': s:none, 'style': s:none })
call Highlight('CursorLine', { 'fg': s:none, 'bg': s:darker_grey, 'style': s:none })
call Highlight('Type', { 'fg': s:none, 'bg': s:none, 'style': s:none })

" quickfix window
call Highlight('qfFileName', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('qfLineNr', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('qfSeparator', { 'fg': s:light_grey, 'bg': s:none, 'style': s:none })
call Highlight('QuickFixLine', { 'fg': s:light_green, 'bg': s:light_charcoal, 'style': s:bold })

call Highlight('Visual', { 'fg': s:none, 'bg': s:dark_grey, 'style': s:none })
call Highlight('TabLine', { 'fg': s:light_grey, 'bg': s:dark_grey, 'style': s:underline })
call Highlight('Whitespace', { 'fg': s:dark_grey, 'bg': s:none, 'style': s:none })

call Highlight('TabLineSel', { 'fg': s:none, 'bg': s:charcoal, 'style': s:bold })

call Highlight('SignColumn', { 'fg': s:none, 'bg': s:none, 'style': s:none })
call Highlight('NonText', { 'fg': s:darker_grey, 'bg': s:none, 'style': s:none })
call Highlight('TabLineFill', { 'fg': s:none, 'bg': s:darker_grey, 'style': s:none })
call Highlight('LineNr', { 'fg': s:dark_grey, 'bg': s:none, 'style': s:none })
call Highlight('VertSplit', { 'fg': s:darker_grey, 'bg': s:charcoal, 'style': s:none })
call Highlight('StatusLine', { 'fg': s:light_grey, 'bg': s:charcoal, 'style': s:none })
call Highlight('StatusLineNC', { 'fg': s:grey, 'bg': s:darker_grey, 'style': s:none })

call Highlight('StatusLineBase', { 'fg': s:white, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineGitBranch', { 'fg': s:white, 'bg': s:dark_grey, 'style': s:italic })
call Highlight('StatusLineModifiedFile', { 'fg': s:orange, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineReadOnlyFile', { 'fg': s:grey, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineSeparatorGitBranch', { 'fg': s:dark_grey, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineSeparatorNormalDark', { 'fg': s:light_green, 'bg': s:dark_grey, 'style': s:none })
call Highlight('StatusLineSeparatorVisualDark', { 'fg': s:purple, 'bg': s:dark_grey, 'style': s:none })
call Highlight('StatusLineSeparatorInsertDark', { 'fg': s:yellow, 'bg': s:dark_grey, 'style': s:none })
call Highlight('StatusLineSeparatorCommandDark', { 'fg': s:light_blue, 'bg': s:dark_grey, 'style': s:none })
call Highlight('StatusLineSeparatorNormal', { 'fg': s:light_green, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineSeparatorVisual', { 'fg': s:purple, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineSeparatorInsert', { 'fg': s:yellow, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineSeparatorCommand', { 'fg': s:light_blue, 'bg': s:darker_grey, 'style': s:none })
call Highlight('StatusLineNormalMode', { 'fg': s:charcoal, 'bg': s:light_green })
call Highlight('StatusLineVisualMode', { 'fg': s:charcoal, 'bg': s:purple })
call Highlight('StatusLineInsertMode', { 'fg': s:charcoal, 'bg': s:yellow })
call Highlight('StatusLineCommandMode', { 'fg': s:charcoal, 'bg': s:light_blue })
call Highlight('StatusLineNormalModeBold', { 'fg': s:charcoal, 'bg': s:light_green, 'style': s:bold })
call Highlight('StatusLineVisualModeBold', { 'fg': s:charcoal, 'bg': s:purple, 'style': s:bold })
call Highlight('StatusLineInsertModeBold', { 'fg': s:charcoal, 'bg': s:yellow, 'style': s:bold })
call Highlight('StatusLineCommandModeBold', { 'fg': s:charcoal, 'bg': s:light_blue, 'style': s:bold })

call Highlight('Exception', { 'fg': s:magenta, 'bg': s:none, 'style': s:bold })
call Highlight('MatchParen', { 'fg': s:magenta, 'bg': s:none, 'style': s:bold_underline })
call Highlight('Include', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Conditional', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Define', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Debug', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Delimiter', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Keyword', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Macro', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Operator', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('PreProc', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Statement', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('Repeat', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })

call Highlight('diffChange', { 'fg': s:white, 'bg': s:purple_slate, 'style': s:none })
call Highlight('diffText', { 'fg': s:white, 'bg': s:bright_blue, 'style': s:bold })
call Highlight('diffDelete', { 'fg': s:dark_red, 'bg': s:blood_red, 'style': s:none })
call Highlight('diffAdd', { 'fg': s:none, 'bg': s:dark_green, 'style': s:none })
call Highlight('diffAdded', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('diffRemoved', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('diffFile', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('diffLine', { 'fg': s:purple, 'bg': s:none, 'style': s:bold })
call Highlight('diffIndexLine', { 'fg': s:purple, 'bg': s:none, 'style': s:bold })
call Highlight('diffSubname', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })
call Highlight('gitcommitHeader', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('gitcommitSelectedFile', { 'fg': s:orange, 'bg': s:none, 'style': s:none })
call Highlight('gitcommitSummary', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('gitcommitOverflow', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })

call Highlight('SpecialKey', { 'fg': s:dark_grey, 'bg': s:none, 'style': s:none })
call Highlight('IncSearch', { 'fg': s:bright_yellow, 'bg': s:black, 'style': s:bold_underline })
call Highlight('Search', { 'fg': s:black, 'bg': s:bright_yellow, 'style': s:bold })

call Highlight('Identifier', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('Question', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('StorageClass', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('Structure', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('Typedef', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })

call Highlight('Function', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })

call Highlight('PreCondit', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Constant', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Directory', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Tag', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Boolean', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Character', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Float', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('Number', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('jsFutureKeys', { 'fg': s:purple, 'bg': s:none, 'style': s:none })

call Highlight('Folded', { 'fg': s:grey, 'bg': s:none, 'style': s:none })
call Highlight('FoldColumn', { 'fg': s:light_grey, 'bg': s:none, 'style': s:none })
call Highlight('Comment', { 'fg': s:grey, 'bg': s:none, 'style': s:italic })

call Highlight('Label', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })
call Highlight('String', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })

call Highlight('Todo', { 'fg': s:yellow, 'bg': s:dark_grey, 'style': s:bold })
call Highlight('Underlined', { 'fg': s:none, 'bg': s:none, 'style': s:underline })

call Highlight('Pmenu', { 'fg': s:light_blue, 'bg': s:darker_grey, 'style': s:none })
call Highlight('PmenuSel', { 'fg': s:yellow, 'bg': s:dark_grey, 'style': s:none })
call Highlight('PmenuSbar', { 'fg': s:none, 'bg': s:grey, 'style': s:none })
call Highlight('PmenuThumb', { 'fg': s:dark_grey, 'bg': s:white, 'style': s:none })

call Highlight('MoreMsg', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })

" Javascript colour highlighting rules
call Highlight('Noise', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('jsParensIfElse', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsParensRepeat', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsParensSwitch', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsParensCatch', { 'fg': s:white, 'bg': s:none, 'style': s:none })

call Highlight('jsArrowFunction', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('jsArrowFuncArgs', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })

call Highlight('jsBrackets', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsFuncBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsClassBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsIfElseBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })

call Highlight('jsTryCatchBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsModuleBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsObjectBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsFinallyBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsRepeatBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsSwitchBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsTemplateBraces', { 'fg': s:purple, 'bg': s:none, 'style': s:none })

call Highlight('jsDestructuringBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsFuncName', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('jsFuncCall', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('jsClassFuncName', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('jsArguments', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })
call Highlight('jsFuncArgs', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })
call Highlight('jsClassKeyword', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })

call Highlight('jsThis', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })
call Highlight('jsUndefined', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('jsNull', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('jsParens', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsFuncParens', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsGlobalObjects', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('jsFunction', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('jsClassMethodType', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('jsObjectKey', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsBlockLabel', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsObjectColon', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('jsObjectSeparator', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('jsNoise', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('jsGlobalNodeObjects', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })

call Highlight('EcmaScriptTemplateStrings', { 'fg': s:yellow, 'bg': s:none, 'style': s:italic })

hi def link jsComment              Comment
hi def link jsEnvComment           Comment
hi def link jsCommentTodo          Todo
hi def link jsString               String
hi def link jsObjectKeyString      String
hi def link jsTemplateString       String
hi def link jsObjectStringKey      String
hi def link jsClassStringKey       String
hi def link jsStorageClass         StorageClass
hi def link jsNumber               Number
hi def link jsImport               Include
hi def link jsExport               Include
hi def link jsModuleComma          Operator

hi def link jsTaggedTemplate       StorageClass
hi def link jsTernaryIfOperator    Operator
hi def link jsRegexpString         String
hi def link jsRegexpBoundary       SpecialChar
hi def link jsRegexpQuantifier     SpecialChar
hi def link jsRegexpOr             Conditional
hi def link jsRegexpMod            SpecialChar
hi def link jsRegexpBackRef        SpecialChar
hi def link jsRegexpGroup          String

hi def link jsRegexpCharClass      Character
hi def link jsCharacter            Character
hi def link jsPrototype            Special
hi def link jsConditional          Conditional
hi def link jsBranch               Conditional
hi def link jsLabel                Label
hi def link jsReturn               Statement
hi def link jsRepeat               Repeat
hi def link jsDo                   Repeat
hi def link jsStatement            Statement
hi def link jsException            Exception
hi def link jsTry                  Exception
hi def link jsFinally              Exception
hi def link jsCatch                Exception
hi def link jsAsyncKeyword         Keyword
hi def link jsForAwait             Keyword
hi def link jsObjectFuncName       Function
hi def link jsError                Error
hi def link jsParensError          Error
hi def link jsOperatorKeyword      jsOperator
hi def link jsOperator             Operator
hi def link jsOf                   Operator
hi def link jsExtendsKeyword       Keyword
hi def link jsSuper                Constant
hi def link jsNan                  Number
hi def link jsFloat                Float
hi def link jsBooleanTrue          Boolean
hi def link jsBooleanFalse         Boolean
hi def link jsDot                  Noise
hi def link jsClassNoise           Noise
hi def link jsGenerator            jsFunction

hi def link jsSpecial              Special
hi def link jsExceptions           Constant
hi def link jsBuiltins             Constant
hi def link jsExportDefault        StorageClass
hi def link jsExportDefaultGroup   jsExportDefault
hi def link jsModuleAs             Include
hi def link jsModuleAsterisk       Noise
hi def link jsFrom                 Include
hi def link jsDecorator            Special
hi def link jsDecoratorFunction    Function
hi def link jsParensDecorator      jsParens
hi def link jsFuncArgOperator      jsFuncArgs
hi def link jsClassProperty        jsObjectKey
hi def link jsObjectShorthandProp  jsObjectKey
hi def link jsSpreadOperator       Operator
hi def link jsRestOperator         Operator
hi def link jsRestExpression       jsFuncArgs
hi def link jsSwitchColon          Noise
hi def link jsObjectMethodType     Type
hi def link jsClassDefinition      jsFuncName
hi def link jsBlockLabel           Identifier
hi def link jsBlockLabelKey        jsBlockLabel
hi def link jsDestructuringProperty   jsFuncArgs
hi def link jsDestructuringAssignment jsObjectKey
hi def link jsDestructuringNoise      Noise
hi def link jsCommentFunction      jsComment
hi def link jsCommentClass         jsComment
hi def link jsCommentIfElse        jsComment
hi def link jsCommentRepeat        jsComment
hi def link jsDomErrNo             Constant
hi def link jsDomNodeConsts        Constant
hi def link jsDomElemAttrs         Label
hi def link jsDomElemFuncs         PreProc
hi def link jsHtmlEvents           Special
hi def link jsHtmlElemAttrs        Label
hi def link jsHtmlElemFuncs        PreProc
hi def link jsCssStyles            Label

" HTML
call Highlight('htmlTag', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('htmlTagN', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('htmlEndTag', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('htmlArg', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })

" JSX highlighting
call Highlight('jsxTagName', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('jsxComponentName', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('jsxEqual', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('jsxPunct', { 'fg': s:grey, 'bg': s:none, 'style': s:none })
call Highlight('jsxCloseString', { 'fg': s:grey, 'bg': s:none, 'style': s:none })
call Highlight('jsxAttrib', { 'fg': s:white, 'bg': s:none, 'style': s:italic })

" Typescript
" 'HerringtonDarkholme/yats.vim'
call Highlight('typescriptCastKeyword', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptImport', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptExport', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptCall', { 'fg': s:white, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptArrowFuncArg', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptAliasDeclaration', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('typescriptAliasKeyword', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptInterfaceKeyword', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptTypeReference', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('typescriptPredefinedType', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptMember', { 'fg': s:white, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptObjectColon', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTypeAnnotation', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTernaryOp', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptDestructureVariable', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptObjectLabel', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTypeBrackets', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptVariable', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptArrowFunc', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptFuncType', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptMemberOptionality', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptFuncTypeArrow', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptMathStaticMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptJSONStaticMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptDOMStorageMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptDateMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptRegExpMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptArrayMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptHeadersMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptHeadersMethod', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptURLUtilsProp', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptBOMHistoryProp', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptOperator', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptGlobalMathDot', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptDotNotation', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptGlobalJSONDot', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptBinaryOp', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptUnaryOp', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptAssign', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptOptionalMark', { 'fg': s:purple, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptTemplateSB', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTestGlobal', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptPaymentShippingOptionProp', { 'fg': s:none, 'bg': s:none, 'style': s:none })
" 'leafgarland/typescript-vim'
call Highlight('typescriptNull', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('typescriptType', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptEndColons', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptLabel', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptLogicSymbols', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptParens', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptDotNotation', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptInterpolationDelimiter', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('typescriptExceptions', { 'fg': s:magenta, 'bg': s:none, 'style': s:bold })
call Highlight('typescriptFuncKeyword', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })

" New typescript definition names
call Highlight('typescriptGlobalNodeObjects', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('typescriptGlobalObjects', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptArrowFunction', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('typescriptFuncCall', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })

" TypeScript Treesitter
call Highlight('typescriptTSBoolean', { 'fg': s:orange, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSVariable', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSConstructor', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSPunctDelimiter', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSPunctBracket', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSConstant', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSTypeBuiltin', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptTSType', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSKeyword', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('typescriptTSProperty', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('typescriptTSParameter', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })



" GraphQL
call Highlight('graphqlStructure', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('graphqlBraces', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('graphqlConstant', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('graphqlType', { 'fg': s:purple, 'bg': s:none, 'style': s:none })

" vim
call Highlight('vimParenSep', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('vimOperParen', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('vimUserFunc', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('vimFunction', { 'fg': s:orange, 'bg': s:none, 'style': s:none })

" XML highlighting.
hi def link xmlTodo   Todo
call Highlight('xmlTag', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('xmlTagName', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('xmlEndTag', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('xmlEqual', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })

" JSON highlighting
call Highlight('jsonKeyword', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('jsonString', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })

" Clojure highlighting
call Highlight('clojureParen', { 'fg': s:white, 'bg': s:none, 'style': s:none })
call Highlight('clojureDefine', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
call Highlight('clojureMacro', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })

" R language
call Highlight('rFunction', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })

" C/C++
call Highlight('cType', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })

" NERDTree highlighting
call Highlight('NERDTreeClosable', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })
call Highlight('NERDTreeOpenable', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })
call Highlight('NERDTreeDirSlash', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('NERDTreeFile', { 'fg': s:none, 'bg': s:none, 'style': s:none })

" Ruby
call Highlight('rubyStringDelimiter', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })

" Calendar
call Highlight('CalNavi', { 'fg': s:light_blue, 'bg': s:none, 'style': s:bold_underline })
call Highlight('CalToday', { 'fg': s:magenta, 'bg': s:none, 'style': s:bold })
call Highlight('CalSaturday', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('CalSunday', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('CalHeader', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('CalRuler', { 'fg': s:grey, 'bg': s:darker_grey, 'style': s:bold })

" Markdown https://github.com/tpope/vim-markdown/
call Highlight('markdownCode', { 'fg': s:light_grey, 'bg': s:none, 'style': s:bold })
call Highlight('markdownCodeDelimiter', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })

" Markdown https://github.com/plasticboy/vim-markdown
call Highlight('mkdHeading', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('mkdURL', { 'fg': s:orange, 'bg': s:none, 'style': s:none })
call Highlight('mkdCode', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('mkdCodeStart', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('mkdCodeEnd', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('mkdDelimiter', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('mkdCodeDelimiter', { 'fg': s:purple })

" Vimwiki
call Highlight('VimwikiDelText', { 'fg': s:grey, 'bg': s:none, 'style': s:none })
call Highlight('VimwikiHeaderChar', { 'fg': s:magenta, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiHeader1', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiHeader2', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiHeader3', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiHeader4', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiHeader5', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiHeader6', { 'fg': s:white, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiPre', { 'fg': s:light_green, 'bg': s:none, 'style': s:bold })
call Highlight('VimwikiCode', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('VimwikiCodeChar', { 'fg': s:purple, 'bg': s:none, 'style': s:none })
call Highlight('VimwikiBoldChar', { 'fg': s:none, 'bg': s:none, 'style': s:none })
call Highlight('VimwikiItalicChar', { 'fg': s:grey })

" GitGutter
call Highlight('GitGutterAdd', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('GitGutterChange', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('GitGutterDelete', { 'fg': s:magenta, 'bg': s:none, 'style': s:none })
call Highlight('GitGutterChangeDelete', { 'fg': s:orange, 'bg': s:none, 'style': s:none })

" Python
call Highlight('pythonBuiltin', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('pythonBuiltinFunc', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('pythonFunction', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('pythonClass', { 'fg': s:light_green, 'bg': s:none, 'style': s:none })
call Highlight('pythonFunctionCall', { 'fg': s:light_blue, 'bg': s:none, 'style': s:none })
call Highlight('pythonClassVar', { 'fg': s:orange, 'bg': s:none, 'style': s:italic })
call Highlight('pythonExClass', { 'fg': s:light_blue, 'bg': s:none, 'style': s:italic })
hi link pythonTripleQuotes Comment
hi link pythonDoctest Comment
hi link pythonDoctest2 Comment

" Nvim LSP
call Highlight('DiagnosticError', { 'fg': { 'cterm': 197, 'gui': '#fd2c40' }})
hi link LspDiagnosticsDefaultError DiagnosticError
call Highlight('DiagnosticWarn', { 'fg': s:yellow, 'bg': s:none, 'style': s:none })
hi link LspDiagnosticsDefaultWarning DiagnosticWarn
call Highlight('DiagnosticInfo', { 'fg': s:white, 'bg': s:none, 'style': s:none })
hi link LspDiagnosticsDefaultInfo DiagnosticInfo
call Highlight('DiagnosticHint', { 'fg': s:light_grey, 'bg': s:none, 'style': s:none })
hi link LspDiagnosticsDefaultHint DiagnosticHint
call Highlight('DiagnosticUnderlineError', { 'fg': s:none, 'bg': s:none, 'style': s:underline })
hi link LspDiagnosticsUnderlineError DiagnosticUnderlineError
call Highlight('DiagnosticUnderlineWarn', { 'fg': s:none, 'bg': s:none, 'style': s:underline })
hi link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
call Highlight('DiagnosticUnderlineInfo', { 'fg': s:none, 'bg': s:none, 'style': s:underline })
hi link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
call Highlight('DiagnosticUnderlineHint', { 'fg': s:none, 'bg': s:none, 'style': s:underline })
hi link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
