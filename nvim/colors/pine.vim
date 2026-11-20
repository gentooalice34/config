" ~/.config/nvim/colors/rose-pine.vim
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "rose-pine"

" ==== Палитра rose-pine (main) ====
" base заменён на #080814 по запросу, остальное — оригинал
let s:bg        = "#080814"   " base (было #191724)
let s:surface   = "#1f1d2e"
let s:overlay   = "#26233a"
let s:muted     = "#6e6a86"
let s:subtle    = "#908caa"
let s:text      = "#e0def4"

let s:love      = "#eb6f92"
let s:gold      = "#f6c177"
let s:rose      = "#ebbcba"
let s:pine      = "#31748f"
let s:foam      = "#9ccfd8"
let s:iris      = "#c4a7e7"
let s:leaf      = "#95b1ac"

let s:hl_low    = "#21202e"
let s:hl_med    = "#403d52"
let s:hl_high   = "#524f67"

" ==== Основные группы ====
exe "hi Normal       guifg=" . s:text    . " guibg=" . s:bg
exe "hi NormalFloat  guifg=" . s:text    . " guibg=" . s:surface
exe "hi EndOfBuffer  guifg=" . s:bg      . " guibg=" . s:bg
exe "hi Folded       guifg=" . s:muted   . " guibg=" . s:bg . " gui=italic"
exe "hi LineNr       guifg=" . s:muted   . " guibg=" . s:bg
exe "hi CursorLineNr guifg=" . s:rose    . " guibg=" . s:bg . " gui=bold"
exe "hi SignColumn   guifg=" . s:muted   . " guibg=" . s:bg

" ==== Синтаксис ====
exe "hi Comment      guifg=" . s:muted   . " gui=italic"
exe "hi Constant     guifg=" . s:foam
exe "hi String       guifg=" . s:gold
exe "hi Character    guifg=" . s:gold
exe "hi Number       guifg=" . s:iris
exe "hi Boolean      guifg=" . s:iris
exe "hi Float        guifg=" . s:iris

exe "hi Identifier   guifg=" . s:text
exe "hi Function     guifg=" . s:rose

exe "hi Statement    guifg=" . s:love
exe "hi Conditional  guifg=" . s:love
exe "hi Repeat       guifg=" . s:love
exe "hi Label        guifg=" . s:love
exe "hi Operator     guifg=" . s:subtle
exe "hi Keyword      guifg=" . s:love
exe "hi Exception    guifg=" . s:love

exe "hi PreProc      guifg=" . s:pine
exe "hi Include      guifg=" . s:pine
exe "hi Define       guifg=" . s:pine
exe "hi Macro        guifg=" . s:pine
exe "hi PreCondit    guifg=" . s:pine

exe "hi Type         guifg=" . s:foam
exe "hi StorageClass guifg=" . s:foam
exe "hi Structure    guifg=" . s:foam
exe "hi Typedef      guifg=" . s:foam

exe "hi Special      guifg=" . s:gold
exe "hi SpecialChar  guifg=" . s:gold
exe "hi Tag          guifg=" . s:love
exe "hi Delimiter    guifg=" . s:subtle
exe "hi SpecialComment guifg=" . s:muted . " gui=italic"
exe "hi Debug        guifg=" . s:love

exe "hi Underlined   guifg=" . s:foam . " gui=underline"
exe "hi Ignore       guifg=" . s:bg
exe "hi Error        guifg=" . s:love . " guibg=" . s:bg
exe "hi Todo         guifg=" . s:gold . " guibg=" . s:bg . " gui=bold"

" ==== UI ====
exe "hi Cursor       guifg=" . s:bg   . " guibg=" . s:text
exe "hi CursorLine   guibg=" . s:hl_low
exe "hi CursorColumn guibg=" . s:hl_low

exe "hi Pmenu        guifg=" . s:text   . " guibg=" . s:surface
exe "hi PmenuSel     guifg=" . s:bg     . " guibg=" . s:rose . " gui=bold"
exe "hi PmenuSbar    guibg=" . s:overlay
exe "hi PmenuThumb   guibg=" . s:muted

exe "hi StatusLine   guifg=" . s:bg . " guibg=" . s:rose . " gui=bold"
exe "hi StatusLineNC guifg=" . s:muted . " guibg=" . s:bg
exe "hi TabLine      guifg=" . s:muted . " guibg=" . s:bg
exe "hi TabLineSel   guifg=" . s:bg . " guibg=" . s:rose . " gui=bold"
exe "hi TabLineFill  guifg=" . s:muted . " guibg=" . s:bg

exe "hi VertSplit    guifg=" . s:hl_med . " guibg=" . s:bg
exe "hi Visual       guibg=" . s:hl_med
exe "hi VisualNOS    guibg=" . s:hl_med

exe "hi DiffAdd      guifg=" . s:pine . " guibg=" . s:bg
exe "hi DiffChange   guifg=" . s:gold . " guibg=" . s:bg
exe "hi DiffDelete   guifg=" . s:love . " guibg=" . s:bg
exe "hi DiffText     guifg=" . s:foam . " guibg=" . s:bg . " gui=bold"

exe "hi Search       guifg=" . s:bg . " guibg=" . s:gold
exe "hi IncSearch    guifg=" . s:bg . " guibg=" . s:love

exe "hi Directory    guifg=" . s:foam
exe "hi Title        guifg=" . s:rose . " gui=bold"

" ==== Дополнительно ====
exe "hi htmlTag      guifg=" . s:love
exe "hi htmlTagName  guifg=" . s:foam
exe "hi htmlArg      guifg=" . s:gold

exe "hi javaScript   guifg=" . s:text
exe "hi javaScriptIdentifier guifg=" . s:love
exe "hi javaScriptOperator   guifg=" . s:subtle

exe "hi cssDefinition guifg=" . s:love
exe "hi cssTagName    guifg=" . s:foam
exe "hi cssProp       guifg=" . s:gold
exe "hi cssValue      guifg=" . s:text

exe "hi jsonString   guifg=" . s:gold
exe "hi jsonKeyword  guifg=" . s:pine
exe "hi jsonBoolean  guifg=" . s:iris
exe "hi jsonNumber   guifg=" . s:iris
