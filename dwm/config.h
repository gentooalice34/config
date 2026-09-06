/* appearance */
static const unsigned int borderpx  = 2;        
static const unsigned int snap      = 32;
static const int showbar            = 0;
static const int topbar             = 0;
static const int resizehints        = 0;        
static const int lockfullscreen     = 1;
static const int reservedbar        = 1;       
static const int bartype            = 0;        
static const int user_bh            = 45;        
static const char *fonts[]          = { "NotoSans-Regular:size=12" };
static const char dmenufont[]       = "monospace:size=10";

static const char col_gray1[] = "#dddaec";
static const char col_gray2[] = "#54487a";
static const char col_gray3[] = "#fafafa";
static const char col_gray4[] = "#ff00ff";
static const char col_accent[] = "#d9534f";
//nord static const char col_gray1[]       = "#2e3440"; 
//static const char col_gray2[]       = "#3b4252";
//static const char col_gray3[]       = "#d8dee9";
//static const char col_gray4[]       = "#eceff4";
//static const char col_accent[]      = "#81a1c1";
static const char *colors[][3]      = {
	/*               fg         bg         border      */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2   },
	[SchemeSel]  = { col_gray4, col_gray1, col_gray3   }, /* focused_border_color d8dee9 */
};

/* vanitygaps — mirrors bspc config window_gap 6 */
static const unsigned int gappih    = 6;
static const unsigned int gappiv    = 6;
static const unsigned int gappoh    = 6;
static const unsigned int gappov    = 6;
static       int smartgaps          = 1;        /* gapless_mode true: no outer gap w/ 1 client */
#include "vanitygaps.c"

/* tagging — dwm only supports 9 numbered tags off keys 1-9.
 * bspwm's 10th desktop ("0") has no clean home: dwm's "0" key is the
 * built-in "view all tags" shortcut. Left as 9 tags; see PATCHES.md
 * if you want to sacrifice that shortcut for a literal 10th tag. */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Screenkey",NULL,       NULL,       0,            1,           -1 },
  { "polybar",  NULL,       NULL,       0,            1,           -1 },/* bspc rule -a Screenkey manage=off */
};

/* layout(s) — split_ratio 0.52 */
static const float mfact     = 0.52;
static const int nmaster     = 1;
static const int refreshrate = 120;

static const Layout layouts[] = {
	{ "[]=",      tile },    /* super+t : tiled, gapped via vanitygaps */
	{ "><>",      NULL },    /* super+s : floating */
	{ "[M]",      monocle }, /* monocle has no gaps/no extra border logic already ~= borderless_monocle */
};

#define MODKEY Mod4Mask      /* bspwmrc: pointer_modifier mod4 -> super, not alt */
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0";
//static const char *termcmd[]      = { "kitty", NULL };
//static const char *filemgrcmd[]   = { "kitty", "-e", "spf", NULL };
static const char *termcmd[]      = {"st", NULL};
static const char *filemgrcmd[]   = {"st", "-e", "spf", NULL};
static const char *browsercmd[]   = { "firefox-bin", NULL };
static const char *browser2cmd[]  = { "chromium-bin", NULL };
static const char *codecmd[]      = { "code", NULL };
static const char *thunarcmd[]    = { "thunar", NULL };
static const char *steamcmd[]     = { "steam", NULL };

static const Key keys[] = {
	/* modifier                     key            function        argument */
	{ MODKEY,                       XK_Return,     spawn,          {.v = termcmd } },       /* super+Return -> kitty */
	{ MODKEY,                       XK_q,          killclient,     {0} },                   /* super+q -> bspc node -c */
	{ MODKEY|ControlMask|ShiftMask, XK_q,          quit,           {.i = 0} },               /* logout (dwm has no bspwm-style "always running" model) */
	{ MODKEY|ShiftMask,             XK_r,          quit,           {.i = 1} },               /* super+shift+r -> bspc wm -r (restartsig patch) */
	{ MODKEY|ShiftMask,             XK_q,          killalltag,     {0} },                   /* super+shift+q -> close every window on this tag (custom fn) */

	/* OPTIONAL: only if you applied the community hide/restore patch
	 * (needs the awesomebar patch too — see PATCHES.md). Otherwise
	 * leave commented out; dwm.c won't have hidewin/restorewin.
	{ MODKEY,                       XK_m,          hidewin,        {0} },
	{ MODKEY|Mod1Mask,               XK_m,          restorewin,     {0} },
	*/

	{ MODKEY,                       XK_f,          fullscreen,     {0} },                   /* super+f -> bspc node -t fullscreen (fullscreen patch) */
	{ MODKEY,                       XK_c,          centerfloating, {0} },                   /* super+c -> centre.sh (custom fn) */

	TAGKEYS(                        XK_1,                          0)
	TAGKEYS(                        XK_2,                          1)
	TAGKEYS(                        XK_3,                          2)
	TAGKEYS(                        XK_4,                          3)
	TAGKEYS(                        XK_5,                          4)
	TAGKEYS(                        XK_6,                          5)
	TAGKEYS(                        XK_7,                          6)
	TAGKEYS(                        XK_8,                          7)
	TAGKEYS(                        XK_9,                          8)

	{ MODKEY,                       XK_Tab,        focusstack,     {.i = +1 } },            /* super+Tab -> next.local */
	{ MODKEY|ShiftMask,             XK_Tab,        focusstack,     {.i = -1 } },            /* super+shift+Tab -> prev.local */

	/* dwm has no spatial (west/south/north/east) client model like bspwm's
	 * binary tree — it's a master/stack list. These are the closest native
	 * mappings, NOT a 1:1 port. See PATCHES.md "no equivalent" section. */
	{ MODKEY,                       XK_j,          focusstack,     {.i = +1 } },            /* cycle stack, not "south" */
	{ MODKEY,                       XK_k,          focusstack,     {.i = -1 } },            /* cycle stack, not "north" */
	{ MODKEY,                       XK_h,          setmfact,       {.f = -0.05} },          /* dwm-native: shrink master area, NOT "focus west" */
	{ MODKEY,                       XK_l,          setmfact,       {.f = +0.05} },          /* dwm-native: grow master area, NOT "focus east" */
	{ MODKEY|ShiftMask,             XK_j,          pushdown,       {0} },                   /* push patch: closest thing to bspc node -s south */
	{ MODKEY|ShiftMask,             XK_k,          pushup,         {0} },                   /* push patch: closest thing to bspc node -s north */
	{ MODKEY|ShiftMask,             XK_h,          setcfact,       {.f = +0.25} },          /* cfacts patch: grow focused client's share of the stack */
	{ MODKEY|ShiftMask,             XK_l,          setcfact,       {.f = -0.25} },          /* cfacts patch: shrink it */

	{ MODKEY,                       XK_Left,       focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Down,       focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Up,         focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Right,      focusstack,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Down,       pushdown,       {0} },
	{ MODKEY|ShiftMask,             XK_Up,         pushup,         {0} },

	{ MODKEY,                       XK_space,      zoom,           {0} },                   /* closest to "swap with biggest.local": swap with master */
	{ MODKEY,                       XK_s,          togglefloating, {0} },                   /* super+s -> bspc node -t floating */
	{ MODKEY,                       XK_t,          setlayout,      {.v = &layouts[0]} },    /* super+t -> bspc node -t tiled */
  { MODKEY,                       XK_m,          setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_d,          spawn,          SHCMD("~/.config/rofi/launchers/type-3/launcher.sh") },  /* super+d -> rofi launcher */
	{ 0,                             XK_Print,      spawn,         SHCMD("scrot -e 'mv $f ~/Pictures/Screenshots/'") },
	{ MODKEY,                       XK_Print,      spawn,          SHCMD("scrot -s -e 'mv $f ~/Pictures/Screenshots/'") },

	{ MODKEY,                       XK_b,          spawn,          {.v = browsercmd } },
	{ MODKEY|Mod1Mask,               XK_b,          spawn,          {.v = browser2cmd } },
	{ MODKEY,                       XK_x,          spawn,          {.v = codecmd } },
	{ MODKEY,                       XK_e,          spawn,          {.v = filemgrcmd } },
	{ MODKEY|ShiftMask,             XK_e,          spawn,          {.v = thunarcmd } },
	{ MODKEY,                       XK_p,          spawn,          {.v = steamcmd } },

	/* dynamic gaps, matches super+ctrl+plus/minus (vanitygaps patch) */
	{ MODKEY|ControlMask,           XK_equal,      incrgaps,       {.i = +4 } },
	{ MODKEY|ControlMask,           XK_minus,      incrgaps,       {.i = -4 } },

	/* keyboard resize of FLOATING clients only (moveresize patch).
	 * dwm has no per-edge resize of tiled clients like bspc node -z;
	 * setcfact above (super+shift+h/l) is the tiled-side equivalent. */
	{ MODKEY|ControlMask,           XK_Right,      moveresize,     {.v = (int []){ 25, 0, 0, 0 }}},
	{ MODKEY|ControlMask,           XK_Left,       moveresize,     {.v = (int []){ -25, 0, 0, 0 }}},
	{ MODKEY|ControlMask,           XK_Down,       moveresize,     {.v = (int []){ 0, 0, 0, 25 }}},
	{ MODKEY|ControlMask,           XK_Up,         moveresize,     {.v = (int []){ 0, 0, 0, -25 }}},
};

static const Button buttons[] = {
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
