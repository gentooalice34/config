set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "gothic"

" Kitty цвета (из kitty.conf)
let s:bg = "#000000"           " background
let s:fg = "#fafafa"           " foreground
let s:bright_fg = "#fafafa"    " bright_black (color8)
let s:color0 = "#000000"       " black
let s:color1 = "#d9534f"       " red
let s:color2 = "#61538d"       " green
let s:color3 = "#6e56af"       " yellow/purple
let s:color4 = "#6e56af"       " blue/purple
let s:color5 = "#ff00ff"       " magenta
let s:color6 = "#61538d"       " cyan/purple
let s:color7 = "#dddaec"       " white
let s:color8 = "#fafafa"       " bright_black
let s:color9 = "#d9634f"       " bright_red
let s:color10 = "#61538d"      " bright_green
let s:color11 = "#6e56af"      " bright_yellow
let s:color12 = "#fafafa"      " bright_blue
let s:color13 = "#ff00ff"      " bright_magenta
let s:color14 = "#61538d"      " bright_cyan
let s:color15 = "#dddaec"      " bright_white

" Дополнительные цвета для комфорта
let s:cursor_line = "#1a1a1a"  " фон для cursorline
let s:comment = "#6e56af"      " цвет комментариев
let s:error = "#d9534f"        " цвет ошибок
let s:warning = "#d9634f"      " цвет предупреждений
let s:search = "#ff00ff"       " цвет поиска

" Основные группы
exe "hi Normal guifg=" . s:fg . " guibg=" . s:bg
exe "hi NormalFloat guifg=" . s:fg . " guibg=" . s:bg
exe "hi EndOfBuffer guifg=" . s:bg . " guibg=" . s:bg
exe "hi Folded guifg=" . s:comment . " guibg=" . s:cursor_line
exe "hi LineNr guifg=" . s:color6 . " guibg=" . s:bg
exe "hi SignColumn guifg=" . s:fg . " guibg=" . s:bg

" Синтаксис
exe "hi Comment guifg=" . s:comment . " gui=italic"
exe "hi Constant guifg=" . s:color5
exe "hi String guifg=" . s:color2
exe "hi Character guifg=" . s:color2
exe "hi Number guifg=" . s:color5
exe "hi Boolean guifg=" . s:color5
exe "hi Float guifg=" . s:color5

exe "hi Identifier guifg=" . s:color4
exe "hi Function guifg=" . s:color3

exe "hi Statement guifg=" . s:color4
exe "hi Conditional guifg=" . s:color4
exe "hi Repeat guifg=" . s:color4
exe "hi Label guifg=" . s:color4
exe "hi Operator guifg=" . s:color4
exe "hi Keyword guifg=" . s:color4
exe "hi Exception guifg=" . s:color4

exe "hi PreProc guifg=" . s:color5
exe "hi Include guifg=" . s:color5
exe "hi Define guifg=" . s:color5
exe "hi Macro guifg=" . s:color5
exe "hi PreCondit guifg=" . s:color5

exe "hi Type guifg=" . s:color6
exe "hi StorageClass guifg=" . s:color6
exe "hi Structure guifg=" . s:color6
exe "hi Typedef guifg=" . s:color6

exe "hi Special guifg=" . s:color5
exe "hi SpecialChar guifg=" . s:color5
exe "hi Tag guifg=" . s:color3
exe "hi Delimiter guifg=" . s:fg
exe "hi SpecialComment guifg=" . s:comment . " gui=italic"
exe "hi Debug guifg=" . s:error

exe "hi Underlined guifg=" . s:color4 . " gui=underline"
exe "hi Ignore guifg=" . s:bg
exe "hi Error guifg=" . s:error . " guibg=" . s:bg
exe "hi Todo guifg=" . s:warning . " guibg=" . s:bg . " gui=bold"

" UI элементы
exe "hi Cursor guifg=" . s:bg . " guibg=" . s:fg
exe "hi CursorLine guibg=" . s:cursor_line
exe "hi CursorLineNr guifg=" . s:bright_fg . " guibg=" . s:cursor_line
exe "hi CursorColumn guibg=" . s:cursor_line

exe "hi Pmenu guifg=" . s:fg . " guibg=" . s:cursor_line
exe "hi PmenuSel guifg=" . s:bg . " guibg=" . s:color4
exe "hi PmenuSbar guibg=" . s:color6
exe "hi PmenuThumb guibg=" . s:fg

exe "hi StatusLine guifg=" . s:bright_fg . " guibg=" . s:color6
exe "hi StatusLineNC guifg=" . s:comment . " guibg=" . s:cursor_line
exe "hi TabLine guifg=" . s:comment . " guibg=" . s:cursor_line
exe "hi TabLineSel guifg=" . s:fg . " guibg=" . s:bg
exe "hi TabLineFill guifg=" . s:fg . " guibg=" . s:cursor_line

exe "hi VertSplit guifg=" . s:cursor_line . " guibg=" . s:bg
exe "hi Visual guibg=" . s:color4
exe "hi VisualNOS guibg=" . s:color4

exe "hi DiffAdd guifg=" . s:color2 . " guibg=" . s:cursor_line
exe "hi DiffChange guifg=" . s:color3 . " guibg=" . s:cursor_line
exe "hi DiffDelete guifg=" . s:color1 . " guibg=" . s:cursor_line
exe "hi DiffText guifg=" . s:color4 . " guibg=" . s:cursor_line

exe "hi Search guifg=" . s:bg . " guibg=" . s:search
exe "hi IncSearch guifg=" . s:bg . " guibg=" . s:color5

exe "hi Directory guifg=" . s:color4
exe "hi Title guifg=" . s:fg . " gui=bold"

" Дополнительно для синтаксиса
exe "hi htmlTag guifg=" . s:color4
exe "hi htmlTagName guifg=" . s:color3
exe "hi htmlArg guifg=" . s:color5

exe "hi javaScript guifg=" . s:fg
exe "hi javaScriptValue guifg=" . s:fg
exe "hi javaScriptIdentifier guifg=" . s:color4
exe "hi javaScriptOperator guifg=" . s:color4

exe "hi cssDefinition guifg=" . s:color4
exe "hi cssTagName guifg=" . s:color3
exe "hi cssProp guifg=" . s:color5
exe "hi cssValue guifg=" . s:fg

exe "hi jsonString guifg=" . s:color2
exe "hi jsonKeyword guifg=" . s:color4
exe "hi jsonBoolean guifg=" . s:color5
exe "hi jsonNumber guifg=" . s:color5

" LSP диагностика
exe "hi DiagnosticError guifg=" . s:error
exe "hi DiagnosticWarn guifg=" . s:warning
exe "hi DiagnosticInfo guifg=" . s:color6
exe "hi DiagnosticHint guifg=" . s:comment
exe "hi DiagnosticUnderlineError guifg=" . s:error . " gui=undercurl"
exe "hi DiagnosticUnderlineWarn guifg=" . s:warning . " gui=undercurl"
exe "hi DiagnosticUnderlineInfo guifg=" . s:color6 . " gui=undercurl"
exe "hi DiagnosticUnderlineHint guifg=" . s:comment . " gui=undercurl"
exe "hi DiagnosticFloatingError guifg=" . s:error
exe "hi DiagnosticFloatingWarn guifg=" . s:warning
exe "hi DiagnosticFloatingInfo guifg=" . s:color6
exe "hi DiagnosticFloatingHint guifg=" . s:comment
exe "hi DiagnosticSignError guifg=" . s:error
exe "hi DiagnosticSignWarn guifg=" . s:warning
exe "hi DiagnosticSignInfo guifg=" . s:color6
exe "hi DiagnosticSignHint guifg=" . s:comment

" Git
exe "hi diffAdded guifg=" . s:color2
exe "hi diffRemoved guifg=" . s:color1
exe "hi diffChanged guifg=" . s:color3

" Treesitter (если используется)
exe "hi @comment guifg=" . s:comment . " gui=italic"
exe "hi @keyword guifg=" . s:color4
exe "hi @keyword.function guifg=" . s:color4
exe "hi @keyword.operator guifg=" . s:color4
exe "hi @constant guifg=" . s:color5
exe "hi @constant.builtin guifg=" . s:color5
exe "hi @constant.macro guifg=" . s:color5
exe "hi @string guifg=" . s:color2
exe "hi @string.regex guifg=" . s:color2
exe "hi @string.escape guifg=" . s:color2
exe "hi @function guifg=" . s:color3
exe "hi @function.builtin guifg=" . s:color3
exe "hi @function.macro guifg=" . s:color3
exe "hi @variable guifg=" . s:fg
exe "hi @variable.builtin guifg=" . s:fg
exe "hi @type guifg=" . s:color6
exe "hi @type.builtin guifg=" . s:color6
exe "hi @type.qualifier guifg=" . s:color6
exe "hi @number guifg=" . s:color5
exe "hi @boolean guifg=" . s:color5
exe "hi @float guifg=" . s:color5
exe "hi @property guifg=" . s:color6
exe "hi @attribute guifg=" . s:color5
exe "hi @namespace guifg=" . s:color4
exe "hi @include guifg=" . s:color5
exe "hi @operator guifg=" . s:color4
exe "hi @punctuation.delimiter guifg=" . s:fg
exe "hi @punctuation.bracket guifg=" . s:fg
exe "hi @punctuation.special guifg=" . s:color5
exe "hi @label guifg=" . s:color4
exe "hi @character guifg=" . s:color2
exe "hi @character.special guifg=" . s:color2
