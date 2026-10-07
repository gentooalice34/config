" ~/.config/nvim/colors/aero.vim
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "aero"

" ==== Палитра из colors.json (pywal) ====
let s:bg       = "#0c0509"   " color0 / background
let s:fg       = "#c2c0c1"   " color7 / foreground
let s:bright   = "#c2c0c1"   " color15

let s:c0  = "#0c0509"   " black
let s:c1  = "#732a12"   " red
let s:c2  = "#374962"   " green
let s:c3  = "#4c5a6e"   " yellow
let s:c4  = "#795f4b"   " blue
let s:c5  = "#827c7f"   " magenta
let s:c6  = "#be9b8a"   " cyan
let s:c7  = "#c2c0c1"   " white

let s:c8  = "#675560"   " bright black
let s:c9  = "#732a12"   " bright red
let s:c10 = "#374962"   " bright green
let s:c11 = "#4c5a6e"   " bright yellow
let s:c12 = "#795f4b"   " bright blue
let s:c13 = "#827c7f"   " bright magenta
let s:c14 = "#be9b8a"   " bright cyan
let s:c15 = "#c2c0c1"   " bright white

" ==== Основные группы ====
exe "hi Normal       guifg=" . s:fg . " guibg=" . s:bg
exe "hi NormalFloat  guifg=" . s:fg . " guibg=" . s:c8
exe "hi EndOfBuffer  guifg=" . s:bg . " guibg=" . s:bg
exe "hi Folded       guifg=" . s:c8 . " guibg=" . s:bg . " gui=italic"
exe "hi LineNr       guifg=" . s:c8 . " guibg=" . s:bg
exe "hi CursorLineNr guifg=" . s:c6 . " guibg=" . s:bg . " gui=bold"
exe "hi SignColumn   guifg=" . s:c8 . " guibg=" . s:bg

" ==== Синтаксис ====
exe "hi Comment      guifg=" . s:c8 . " gui=italic"
exe "hi Constant     guifg=" . s:c14
exe "hi String       guifg=" . s:c6
exe "hi Character    guifg=" . s:c14
exe "hi Number       guifg=" . s:c14
exe "hi Boolean      guifg=" . s:c14
exe "hi Float        guifg=" . s:c14

exe "hi Identifier   guifg=" . s:c4
exe "hi Function     guifg=" . s:c4

exe "hi Statement    guifg=" . s:c1
exe "hi Conditional  guifg=" . s:c1
exe "hi Repeat       guifg=" . s:c1
exe "hi Label        guifg=" . s:c1
exe "hi Operator     guifg=" . s:c1
exe "hi Keyword      guifg=" . s:c1
exe "hi Exception    guifg=" . s:c1

exe "hi PreProc      guifg=" . s:c3
exe "hi Include      guifg=" . s:c3
exe "hi Define       guifg=" . s:c3
exe "hi Macro        guifg=" . s:c3
exe "hi PreCondit    guifg=" . s:c3

exe "hi Type         guifg=" . s:c3
exe "hi StorageClass guifg=" . s:c3
exe "hi Structure    guifg=" . s:c3
exe "hi Typedef      guifg=" . s:c3

exe "hi Special      guifg=" . s:c6
exe "hi SpecialChar  guifg=" . s:c6
exe "hi Tag          guifg=" . s:c6
exe "hi Delimiter    guifg=" . s:c7
exe "hi SpecialComment guifg=" . s:c8 . " gui=italic"
exe "hi Debug        guifg=" . s:c1

exe "hi Underlined   guifg=" . s:c4 . " gui=underline"
exe "hi Ignore       guifg=" . s:bg
exe "hi Error        guifg=" . s:c1 . " guibg=" . s:bg
exe "hi Todo         guifg=" . s:c3 . " guibg=" . s:bg . " gui=bold"

" ==== UI ====
exe "hi Cursor       guifg=" . s:bg . " guibg=" . s:fg
exe "hi CursorLine   guibg=#1a0f14"
exe "hi CursorColumn guibg=#1a0f14"

exe "hi Pmenu        guifg=" . s:fg . " guibg=" . s:c8
exe "hi PmenuSel     guifg=" . s:bg . " guibg=" . s:c6 . " gui=bold"
exe "hi PmenuSbar    guibg=" . s:c8
exe "hi PmenuThumb   guibg=" . s:c4

exe "hi StatusLine   guifg=" . s:bg . " guibg=" . s:c6 . " gui=bold"
exe "hi StatusLineNC guifg=" . s:c8 . " guibg=" . s:bg
exe "hi TabLine      guifg=" . s:c8 . " guibg=" . s:bg
exe "hi TabLineSel   guifg=" . s:bg . " guibg=" . s:c6 . " gui=bold"
exe "hi TabLineFill  guifg=" . s:c8 . " guibg=" . s:bg

exe "hi VertSplit    guifg=" . s:c8 . " guibg=" . s:bg
exe "hi Visual       guibg=" . s:c8
exe "hi VisualNOS    guibg=" . s:c8

exe "hi DiffAdd      guifg=" . s:c2 . " guibg=" . s:bg
exe "hi DiffChange   guifg=" . s:c3 . " guibg=" . s:bg
exe "hi DiffDelete   guifg=" . s:c1 . " guibg=" . s:bg
exe "hi DiffText     guifg=" . s:c6 . " guibg=" . s:bg . " gui=bold"

exe "hi Search       guifg=" . s:bg . " guibg=" . s:c3
exe "hi IncSearch    guifg=" . s:bg . " guibg=" . s:c1

exe "hi Directory    guifg=" . s:c4
exe "hi Title        guifg=" . s:c6 . " gui=bold"

" ==== Дополнительно ====
exe "hi htmlTag      guifg=" . s:c1
exe "hi htmlTagName  guifg=" . s:c4
exe "hi htmlArg      guifg=" . s:c3

exe "hi javaScript   guifg=" . s:fg
exe "hi javaScriptIdentifier guifg=" . s:c1
exe "hi javaScriptOperator   guifg=" . s:c1

exe "hi cssDefinition guifg=" . s:c1
exe "hi cssTagName    guifg=" . s:c4
exe "hi cssProp       guifg=" . s:c3
exe "hi cssValue      guifg=" . s:fg

exe "hi jsonString   guifg=" . s:c6
exe "hi jsonKeyword  guifg=" . s:c1
exe "hi jsonBoolean  guifg=" . s:c14
exe "hi jsonNumber   guifg=" . s:c14
