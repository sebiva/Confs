" Vim color file
" A Modified Monokai by Ben White
" Further modified by Sebastian Ivarsson

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "BenokaiPrime"

hi Cursor ctermfg=245 ctermbg=231 cterm=NONE guifg=#8a8a8a guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#5f5f5f gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3a3a3a gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3a3a3a gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3a3a3a gui=NONE
hi CursorLineNr ctermfg=102 ctermbg=234 cterm=underline guifg=#878787 guibg=#1c1c1c gui=underline
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE guifg=#878787 guibg=#3a3a3a gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#626262 guibg=#626262 gui=NONE
hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline guifg=#f12d30 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#ffffff guibg=#626262 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#ffffff guibg=#626262 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#5f5f5f gui=NONE
hi IncSearch ctermfg=235 ctermbg=186 cterm=NONE guifg=#262626 guibg=#e6db74 gui=NONE
hi Search ctermfg=79 ctermbg=NONE cterm=underline guifg=#5fd7af guibg=NONE gui=underline
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi Folded ctermfg=242 ctermbg=235 cterm=NONE guifg=#6c6c6c guibg=#262626 gui=NONE
hi TabLineFill term=bold cterm=bold ctermbg=0
hi Normal ctermfg=231 ctermbg=234 cterm=NONE guifg=#ffffff guibg=#1c1c1c gui=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi Comment ctermfg=248 ctermbg=NONE cterm=NONE guifg=#a8a8a8 guibg=NONE gui=NONE
hi Conditional ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#ffffff guibg=#46830c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#870000 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#ffffff guibg=#005f5f gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#ffffff guibg=#005f87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#ffffff guibg=#f12d30 gui=NONE
hi Error ctermfg=231 ctermbg=124 cterm=NONE guifg=#ffffff guibg=#af0000 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#ffffff guibg=#f12d30 gui=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi Function ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5fd7ff guibg=NONE gui=italic
hi Keyword ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#d7d787 guibg=NONE gui=NONE
hi NonText ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
hi Number ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi Structure ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi Operator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi PreProc ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi SpecialKey ctermfg=236 ctermbg=None cterm=NONE guifg=#303030 guibg=#3c3d37 gui=NONE
hi Statement ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5fd7ff guibg=NONE gui=italic
hi String ctermfg=186 ctermbg=NONE cterm=NONE guifg=#d7d787 guibg=NONE gui=NONE
hi Tag ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#ffffff guibg=NONE gui=bold
hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold guifg=#875f5f guibg=NONE gui=inverse,bold
hi Type ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5fd7ff guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5fd7ff guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f12d30 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE guifg=#d7d787 guibg=NONE gui=NONE
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8700 guibg=NONE gui=italic
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5fd7ff guibg=NONE gui=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guifg=#a787ff guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5fd7ff guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
