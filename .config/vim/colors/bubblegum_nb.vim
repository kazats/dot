" Vim Color File
" Name:       bubblegum.vim
" Version:    0.2
" Maintainer: baskerville <nihilhill *at* gmail *dot* com>

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name="bubblegum_nb"

" Cf. `:h w18`

if &background == "dark"
	" Main    gui=none    cterm=none    term=none
	hi Normal          ctermfg=249    ctermbg=235    cterm=none    guifg=#B2B2B2    guibg=#262626    gui=none
	hi Comment         ctermfg=244    guifg=#808080    gui=none

	" Constant
	hi Constant        ctermfg=186    guifg=#D7D787    gui=none
	hi String          ctermfg=187    guifg=#D7D7AF    gui=none
	hi Character       ctermfg=187    guifg=#D7D7AF    gui=none
	hi Number          ctermfg=179    guifg=#D7AF5F    gui=none
	hi Boolean         ctermfg=187    guifg=#D7D7AF    gui=none
	hi Float           ctermfg=179    guifg=#D7AF5F    gui=none

	" Variable
	hi Identifier      ctermfg=182    guifg=#D7AFD7    gui=none
	hi Function        ctermfg=182    guifg=#D7AFD7    gui=none

	" Keyword
	hi Statement       ctermfg=110    guifg=#87AFD7    gui=none
	hi Conditional     ctermfg=110    guifg=#87AFD7    gui=none
	hi Repeat          ctermfg=110    guifg=#87AFD7    gui=none
	hi Label           ctermfg=110    guifg=#87AFD7    gui=none
	hi Operator        ctermfg=110    guifg=#87AFD7    gui=none
	hi Keyword         ctermfg=110    guifg=#87AFD7    gui=none
	hi Exception       ctermfg=110    guifg=#87AFD7    gui=none

	" Meta
	hi PreProc         ctermfg=150    guifg=#AFD787    gui=none
	hi Include         ctermfg=150    guifg=#AFD787    gui=none
	hi Define          ctermfg=150    guifg=#AFD787    gui=none
	hi Macro           ctermfg=150    guifg=#AFD787    gui=none
	hi PreCondit       ctermfg=150    guifg=#AFD787    gui=none

	" Type
	hi Type            ctermfg=146    guifg=#AFAFD7    gui=none
	hi StorageClass    ctermfg=146    guifg=#AFAFD7    gui=none
	hi Structure       ctermfg=146    guifg=#AFAFD7    gui=none
	hi Typedef         ctermfg=146    guifg=#AFAFD7    gui=none

	" Special
	hi Special         ctermfg=174    guifg=#D78787    gui=none
	hi SpecialChar     ctermfg=174    guifg=#D78787    gui=none
	hi Tag             ctermfg=174    guifg=#D78787    gui=none
	hi Delimiter       ctermfg=174    guifg=#D78787    gui=none
	hi SpecialComment  ctermfg=174    guifg=#D78787    gui=none
	hi Debug           ctermfg=174    guifg=#D78787    gui=none
	hi Underlined      ctermfg=fg    guifg=fg    gui=none
	hi Ignore          ctermfg=bg    guifg=bg    gui=none
	hi Error           ctermfg=231    ctermbg=167    guifg=#FFFFFF    guibg=#D75F5F    gui=none
	hi Todo            ctermfg=244    ctermbg=bg     cterm=none    guifg=#808080    guibg=bg    gui=none

	" Misc
	hi StatusLine      ctermfg=fg     ctermbg=237    cterm=none    guifg=fg    guibg=#3A3A3A    gui=none
	hi StatusLineNC    ctermfg=244    ctermbg=237    cterm=none    guifg=#808080    guibg=#3A3A3A    gui=none
	hi TabLine         ctermfg=fg     ctermbg=237    cterm=none    guifg=fg    guibg=#3A3A3A    gui=none
	hi TabLineSel      ctermfg=253    ctermbg=238    cterm=none    guifg=#DADADA    guibg=#444444    gui=none
	hi TabLineFill     ctermfg=fg     ctermbg=237    cterm=none    guifg=fg    guibg=#3A3A3A    gui=none

	hi Pmenu           ctermfg=fg     ctermbg=237    guifg=fg    guibg=#3A3A3A    gui=none
	hi PmenuSel        ctermfg=231    ctermbg=244    guifg=#FFFFFF    guibg=#808080    gui=none
	hi PmenuSbar       ctermfg=231    ctermbg=244    guifg=#FFFFFF    guibg=#808080    gui=none
	hi PmenuThumb      ctermbg=187    ctermfg=187    guibg=#D7D7AF    guifg=#D7D7AF    gui=none
	hi WildMenu        ctermfg=71     ctermbg=237    cterm=none    guifg=#5FAF5F    guibg=#3A3A3A    gui=none

	hi Visual          ctermfg=bg     ctermbg=117    guifg=bg    guibg=#87D7FF    gui=none
	hi VisualNOS       ctermfg=bg     ctermbg=116    guifg=bg    guibg=#87D7D7    gui=none
	hi VertSplit       ctermfg=237    ctermbg=237    cterm=none    guifg=#3A3A3A    guibg=#3A3A3A    gui=none
	hi LineNr          ctermfg=244    ctermbg=237    guifg=#808080    guibg=#3A3A3A    gui=none

	hi Title           ctermfg=109    guifg=#87AFAF    gui=none
	hi SpecialKey      ctermfg=114    guifg=#87D787    gui=none
	hi NonText         ctermfg=244    guifg=#808080    gui=none
	hi Conceal         ctermfg=77     ctermbg=bg    guifg=#5FD75F    guibg=bg    gui=none
	hi MatchParen      ctermfg=16     ctermbg=215    guifg=#000000    guibg=#FFAF5F    gui=none
	hi Directory       ctermfg=103    guifg=#8787AF    gui=none

	hi ErrorMsg        ctermfg=210    ctermbg=bg    guifg=#FF8787    guibg=bg    gui=none
	hi WarningMsg      ctermfg=140    guifg=#AF87D7    gui=none
	hi MoreMsg         ctermfg=72    guifg=#5FAF87    gui=none
	hi ModeMsg         ctermfg=222    guifg=#FFD787    gui=none

	hi Search          ctermfg=16     ctermbg=179     cterm=none    guifg=#000000    guibg=#D7AF5F    gui=none
	hi IncSearch       ctermfg=231    ctermbg=168     cterm=none    guifg=#FFFFFF    guibg=#D75F87    gui=none
	hi Question        ctermfg=38    guifg=#00AFD7    gui=none

	hi Folded          ctermfg=244    ctermbg=bg    guifg=#808080    guibg=bg    gui=none
	hi FoldColumn      ctermfg=79     ctermbg=237    guifg=#5FD7AF    guibg=#3A3A3A    gui=none
	hi SignColumn      ctermfg=79     ctermbg=237    guifg=#5FD7AF    guibg=#3A3A3A    gui=none
	hi ColorColumn     ctermfg=79     ctermbg=237    guifg=#5FD7AF    guibg=#3A3A3A    gui=none

	hi CursorColumn    ctermbg=237    cterm=none    guibg=#3A3A3A    gui=none
	hi CursorLine      ctermbg=237    cterm=none    guibg=#3A3A3A    gui=none

	hi vimFold         ctermfg=244    guifg=#808080    gui=none
	hi vimCommentTitle ctermfg=fg    guifg=fg    gui=none
	hi helpHyperTextJump ctermfg=74    guifg=#5FAFD7    gui=none

	hi htmlTag         ctermfg=147    guifg=#AFAFFF    gui=none
	hi htmlEndTag      ctermfg=147    guifg=#AFAFFF    gui=none
	hi htmlTagName     ctermfg=175    guifg=#D787AF    gui=none
	hi htmlString      ctermfg=144    guifg=#AFAF87    gui=none

	hi diffFile        ctermfg=244    guifg=#808080    gui=none
	hi diffLine        ctermfg=244    guifg=#808080    gui=none
	hi diffAdded       ctermfg=107    guifg=#87AF5F    gui=none
	hi diffRemoved     ctermfg=175    guifg=#D787AF    gui=none
	hi diffChanged     ctermfg=179    guifg=#D7AF5F    gui=none

	hi diffAdd         ctermfg=16     ctermbg=149    guifg=#000000    guibg=#AFD75F    gui=none
	hi diffDelete      ctermfg=231    ctermbg=fg    guifg=#FFFFFF    guibg=fg    gui=none
	hi diffText        ctermfg=16     ctermbg=211    guifg=#000000    guibg=#FF87AF    gui=none
	hi diffChange      ctermfg=16     ctermbg=217    guifg=#000000    guibg=#FFAFAF    gui=none
	hi diffOldLine     ctermfg=104    guifg=#8787D7    gui=none

	hi SpellBad        ctermfg=210    ctermbg=bg    cterm=underline    guifg=#FF8787    guibg=bg    gui=underline
	hi SpellCap        ctermfg=174    ctermbg=bg    cterm=underline    guifg=#D78787    guibg=bg    gui=underline
	hi SpellRare       ctermfg=181    ctermbg=bg    cterm=underline    guifg=#D7AFAF    guibg=bg    gui=underline
	hi SpellLocal      ctermfg=180    ctermbg=bg    cterm=underline    guifg=#D7AF87    guibg=bg    gui=underline

	hi mkdCode         ctermfg=244    guifg=#808080    gui=none
	hi mkdURL          ctermfg=111    guifg=#87AFFF    gui=none
	hi mkdLink         ctermfg=181    guifg=#D7AFAF    gui=none
else
	" Main
	hi Normal          ctermfg=241    ctermbg=231    cterm=none    guifg=#626262    guibg=#FFFFFF    gui=none
	hi Comment         ctermfg=246    guifg=#949494    gui=none

	" Constant
	hi Constant        ctermfg=64    guifg=#5F8700    gui=none
	hi String          ctermfg=101    guifg=#87875F    gui=none
	hi Character       ctermfg=101    guifg=#87875F    gui=none
	hi Number          ctermfg=136    guifg=#AF8700    gui=none
	hi Boolean         ctermfg=101    guifg=#87875F    gui=none
	hi Float           ctermfg=136    guifg=#AF8700    gui=none

	" Variable
	hi Identifier      ctermfg=133    guifg=#AF5FAF    gui=none
	hi Function        ctermfg=133    guifg=#AF5FAF    gui=none

	" Keyword
	hi Statement       ctermfg=32    guifg=#0087D7    gui=none
	hi Conditional     ctermfg=32    guifg=#0087D7    gui=none
	hi Repeat          ctermfg=32    guifg=#0087D7    gui=none
	hi Label           ctermfg=32    guifg=#0087D7    gui=none
	hi Operator        ctermfg=32    guifg=#0087D7    gui=none
	hi Keyword         ctermfg=32    guifg=#0087D7    gui=none
	hi Exception       ctermfg=32    guifg=#0087D7    gui=none

	" Meta
	hi PreProc         ctermfg=22    guifg=#005F00    gui=none
	hi Include         ctermfg=22    guifg=#005F00    gui=none
	hi Define          ctermfg=22    guifg=#005F00    gui=none
	hi Macro           ctermfg=22    guifg=#005F00    gui=none
	hi PreCondit       ctermfg=22    guifg=#005F00    gui=none

	" Type
	hi Type            ctermfg=61    guifg=#5F5FAF    gui=none
	hi StorageClass    ctermfg=61    guifg=#5F5FAF    gui=none
	hi Structure       ctermfg=61    guifg=#5F5FAF    gui=none
	hi Typedef         ctermfg=61    guifg=#5F5FAF    gui=none

	" Special
	hi Special         ctermfg=167    guifg=#D75F5F    gui=none
	hi SpecialChar     ctermfg=167    guifg=#D75F5F    gui=none
	hi Tag             ctermfg=167    guifg=#D75F5F    gui=none
	hi Delimiter       ctermfg=167    guifg=#D75F5F    gui=none
	hi SpecialComment  ctermfg=167    guifg=#D75F5F    gui=none
	hi Debug           ctermfg=167    guifg=#D75F5F    gui=none
	hi Underlined      ctermfg=fg    guifg=fg    gui=none
	hi Ignore          ctermfg=bg    guifg=bg    gui=none
	hi Error           ctermfg=235    ctermbg=160    guifg=#262626    guibg=#D70000    gui=none
	hi Todo            ctermfg=246    ctermbg=bg     cterm=none    guifg=#949494    guibg=bg    gui=none

	" Misc
	hi StatusLine      ctermfg=fg     ctermbg=254    cterm=none    guifg=fg    guibg=#E4E4E4    gui=none
	hi StatusLineNC    ctermfg=246    ctermbg=254    cterm=none    guifg=#949494    guibg=#E4E4E4    gui=none
	hi TabLine         ctermfg=fg     ctermbg=254    cterm=none    guifg=fg    guibg=#E4E4E4    gui=none
	hi TabLineSel      ctermfg=238    ctermbg=188    cterm=none    guifg=#444444    guibg=#D7D7D7    gui=none
	hi TabLineFill     ctermfg=fg     ctermbg=254    cterm=none    guifg=fg    guibg=#E4E4E4    gui=none

	hi Pmenu           ctermfg=fg     ctermbg=254    guifg=fg    guibg=#E4E4E4    gui=none
	hi PmenuSel        ctermfg=235    ctermbg=246    guifg=#262626    guibg=#949494    gui=none
	hi PmenuSbar       ctermfg=235    ctermbg=246    guifg=#262626    guibg=#949494    gui=none
	hi PmenuThumb      ctermbg=101    ctermfg=101    guibg=#87875F    guifg=#87875F    gui=none
	hi WildMenu        ctermfg=34     ctermbg=254    cterm=none    guifg=#00AF00    guibg=#E4E4E4    gui=none

	hi Visual          ctermfg=bg     ctermbg=24    guifg=bg    guibg=#005F87    gui=none
	hi VisualNOS       ctermfg=bg     ctermbg=23    guifg=bg    guibg=#005F5F    gui=none
	hi VertSplit       ctermfg=254    ctermbg=254    cterm=none    guifg=#E4E4E4    guibg=#E4E4E4    gui=none
	hi LineNr          ctermfg=246    ctermbg=254    guifg=#949494    guibg=#E4E4E4    gui=none

	hi Title           ctermfg=30    guifg=#008787    gui=none
	hi SpecialKey      ctermfg=41    guifg=#00D75F    gui=none
	hi NonText         ctermfg=246    guifg=#949494    gui=none
	hi Conceal         ctermfg=40     ctermbg=bg    guifg=#00D700    guibg=bg    gui=none
	hi MatchParen      ctermfg=255     ctermbg=166    guifg=#EEEEEE    guibg=#D75F00    gui=none
	hi Directory       ctermfg=104    guifg=#8787D7    gui=none

	hi ErrorMsg        ctermfg=197    ctermbg=bg    guifg=#FF005F    guibg=bg    gui=none
	hi WarningMsg      ctermfg=134    guifg=#AF5FD7    gui=none
	hi MoreMsg         ctermfg=35    guifg=#00AF5F    gui=none
	hi ModeMsg         ctermfg=130    guifg=#AF5F00    gui=none

	hi Search          ctermfg=255     ctermbg=136     cterm=none    guifg=#EEEEEE    guibg=#AF8700    gui=none
	hi IncSearch       ctermfg=235    ctermbg=198     cterm=none    guifg=#262626    guibg=#FF0087    gui=none
	hi Question        ctermfg=38    guifg=#00AFD7    gui=none

	hi Folded          ctermfg=246    ctermbg=bg    guifg=#949494    guibg=bg    gui=none
	hi FoldColumn      ctermfg=29     ctermbg=254    guifg=#00875F    guibg=#E4E4E4    gui=none
	hi SignColumn      ctermfg=29     ctermbg=254    guifg=#00875F    guibg=#E4E4E4    gui=none
	hi ColorColumn     ctermfg=29     ctermbg=254    guifg=#00875F    guibg=#E4E4E4    gui=none

	hi CursorColumn    ctermbg=254    cterm=none    guibg=#E4E4E4    gui=none
	hi CursorLine      ctermbg=254    cterm=none    guibg=#E4E4E4    gui=none

	hi vimFold         ctermfg=246    guifg=#949494    gui=none
	hi vimCommentTitle ctermfg=fg    guifg=fg    gui=none
	hi helpHyperTextJump ctermfg=31    guifg=#0087AF    gui=none

	hi htmlTag         ctermfg=26    guifg=#005FD7    gui=none
	hi htmlEndTag      ctermfg=26    guifg=#005FD7    gui=none
	hi htmlTagName     ctermfg=169    guifg=#D75FAF    gui=none
	hi htmlString      ctermfg=58    guifg=#5F5F00    gui=none

	hi diffFile        ctermfg=246    guifg=#949494    gui=none
	hi diffLine        ctermfg=246    guifg=#949494    gui=none
	hi diffAdded       ctermfg=28    guifg=#008700    gui=none
	hi diffRemoved     ctermfg=169    guifg=#D75FAF    gui=none
	hi diffChanged     ctermfg=136    guifg=#AF8700    gui=none

	hi diffAdd         ctermfg=255     ctermbg=70    guifg=#EEEEEE    guibg=#5FAF00    gui=none
	hi diffDelete      ctermfg=235    ctermbg=fg    guifg=#262626    guibg=fg    gui=none
	hi diffText        ctermfg=255     ctermbg=162    guifg=#EEEEEE    guibg=#D70087    gui=none
	hi diffChange      ctermfg=255     ctermbg=88    guifg=#EEEEEE    guibg=#870000    gui=none
	hi diffOldLine     ctermfg=69    guifg=#5F87FF    gui=none

	hi SpellBad        ctermfg=197    ctermbg=bg    cterm=underline    guifg=#FF005F    guibg=bg    gui=underline
	hi SpellCap        ctermfg=167    ctermbg=bg    cterm=underline    guifg=#D75F5F    guibg=bg    gui=underline
	hi SpellRare       ctermfg=95    ctermbg=bg    cterm=underline    guifg=#875F5F    guibg=bg    gui=underline
	hi SpellLocal      ctermfg=94    ctermbg=bg    cterm=underline    guifg=#875F00    guibg=bg    gui=underline

	hi mkdCode         ctermfg=246    guifg=#949494    gui=none
	hi mkdURL          ctermfg=33    guifg=#0087FF    gui=none
	hi mkdLink         ctermfg=95    guifg=#875F5F    gui=none
endif
