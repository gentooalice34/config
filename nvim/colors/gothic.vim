set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "gothic"

" Kitty цвета
let s:bg = "#0b0b0c"
let s:fg = "#485a63"
let s:bright_fg = "#d9dadf"
let s:color0 = "#0b0b0c"
let s:color1 = "#553b78"
let s:color2 = "#5d625e"
let s:color3 = "#f0f1f5"
let s:color4 = "#2c3a5a"
let s:color5 = "#3f2c5a"
let s:color6 = "#616269"
let s:color7 = "#d9dadf"
let s:color8 = "#c1c2c4"
let s:color9 = "#a81423"
let s:color10 = "#a6946c"
let s:color11 = "#7b827d"
let s:color12 = "#394b75"
let s:color13 = "#8c0d1a"
let s:color14 = "#627985"
let s:color15 = "#8c7c5a"

" Основные группы
exe "hi Normal guifg=" . s:fg . " guibg=" . s:bg
exe "hi NormalFloat guifg=" . s:fg . " guibg=" . s:bg
exe "hi EndOfBuffer guifg=" . s:bg . " guibg=" . s:bg
exe "hi Folded guifg=" . s:fg . " guibg=" . s:color5
exe "hi LineNr guifg=" . s:color6 . " guibg=" . s:bg
exe "hi SignColumn guifg=" . s:fg . " guibg=" . s:bg

" Синтаксис
exe "hi Comment guifg=" . s:color6 . " gui=italic"
exe "hi Constant guifg=" . s:color11
exe "hi String guifg=" . s:color3
exe "hi Character guifg=" . s:color11
exe "hi Number guifg=" . s:color11
exe "hi Boolean guifg=" . s:color11
exe "hi Float guifg=" . s:color11

exe "hi Identifier guifg=" . s:color14
exe "hi Function guifg=" . s:color14

exe "hi Statement guifg=" . s:color13
exe "hi Conditional guifg=" . s:color13
exe "hi Repeat guifg=" . s:color13
exe "hi Label guifg=" . s:color13
exe "hi Operator guifg=" . s:color13
exe "hi Keyword guifg=" . s:color13
exe "hi Exception guifg=" . s:color13

exe "hi PreProc guifg=" . s:color11
exe "hi Include guifg=" . s:color11
exe "hi Define guifg=" . s:color11
exe "hi Macro guifg=" . s:color11
exe "hi PreCondit guifg=" . s:color11

exe "hi Type guifg=" . s:color12
exe "hi StorageClass guifg=" . s:color12
exe "hi Structure guifg=" . s:color12
exe "hi Typedef guifg=" . s:color12

exe "hi Special guifg=" . s:color15
exe "hi SpecialChar guifg=" . s:color15
exe "hi Tag guifg=" . s:color15
exe "hi Delimiter guifg=" . s:color15
exe "hi SpecialComment guifg=" . s:color6 . " gui=italic"
exe "hi Debug guifg=" . s:color9

exe "hi Underlined guifg=" . s:color14 . " gui=underline"
exe "hi Ignore guifg=" . s:bg
exe "hi Error guifg=" . s:color1 . " guibg=" . s:bg
exe "hi Todo guifg=" . s:color11 . " guibg=" . s:bg . " gui=bold"

" UI элементы
exe "hi Cursor guifg=" . s:bg . " guibg=" . s:fg
exe "hi CursorLine guibg=" . s:color5
exe "hi CursorLineNr guifg=" . s:bright_fg . " guibg=" . s:color5
exe "hi CursorColumn guibg=" . s:color5

exe "hi Pmenu guifg=" . s:fg . " guibg=" . s:color5
exe "hi PmenuSel guifg=" . s:bright_fg . " guibg=" . s:color13
exe "hi PmenuSbar guibg=" . s:color6
exe "hi PmenuThumb guibg=" . s:color10

exe "hi StatusLine guifg=" . s:bright_fg . " guibg=" . s:color5
exe "hi StatusLineNC guifg=" . s:color6 . " guibg=" . s:color5
exe "hi TabLine guifg=" . s:fg . " guibg=" . s:color5
exe "hi TabLineSel guifg=" . s:bright_fg . " guibg=" . s:color13
exe "hi TabLineFill guifg=" . s:fg . " guibg=" . s:color5

exe "hi VertSplit guifg=" . s:color5 . " guibg=" . s:bg
exe "hi Visual guibg=" . s:color5
exe "hi VisualNOS guibg=" . s:color5

exe "hi DiffAdd guifg=" . s:fg . " guibg=" . s:color2
exe "hi DiffChange guifg=" . s:fg . " guibg=" . s:color4
exe "hi DiffDelete guifg=" . s:color1 . " guibg=" . s:bg
exe "hi DiffText guifg=" . s:bright_fg . " guibg=" . s:color4

exe "hi Search guifg=" . s:bg . " guibg=" . s:color11
exe "hi IncSearch guifg=" . s:bg . " guibg=" . s:color13

exe "hi Directory guifg=" . s:color14
exe "hi Title guifg=" . s:color11 . " gui=bold"

" Дополнительно для синтаксиса
exe "hi htmlTag guifg=" . s:color13
exe "hi htmlTagName guifg=" . s:color14
exe "hi htmlArg guifg=" . s:color11

exe "hi javaScript guifg=" . s:fg
exe "hi javaScriptValue guifg=" . s:fg
exe "hi javaScriptIdentifier guifg=" . s:color13
exe "hi javaScriptOperator guifg=" . s:color13

exe "hi cssDefinition guifg=" . s:color13
exe "hi cssTagName guifg=" . s:color14
exe "hi cssProp guifg=" . s:color11
exe "hi cssValue guifg=" . s:fg

exe "hi jsonString guifg=" . s:color3
exe "hi jsonKeyword guifg=" . s:color13
exe "hi jsonBoolean guifg=" . s:color11
exe "hi jsonNumber guifg=" . s:color11
