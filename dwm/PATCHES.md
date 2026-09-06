# Getting from bspwm back to dwm — patch list & notes

Everything below was checked against the current suckless.org patch pages
(not from memory), so the function/variable names match what you'll
actually download. `config.h` in this same folder assumes all of these
are applied.

## 1. Get a clean source tree

Gentoo ships dwm as `x11-wm/dwm`. To patch it you want the *live* build
workflow: emerge with `USE=""` won't let you inject patches, so either:

- `git clone https://git.suckless.org/dwm` and build it yourself (simplest), or
- use an overlay that supports patch stacking (e.g. a local `9999` ebuild
  with `PATCHES=` in an ebuild override).

Building it yourself from git is the path of least resistance and is what
upstream expects anyway — `make clean install` after patching.

## 2. Patches, in the order to apply them

Apply in this order — several of these touch the same functions
(`arrange()`, the `Client` struct, `keys[]`), so applying `pertag` last
avoids most conflicts.

| # | Patch | What it gives you | bspwm feature it replaces |
|---|-------|--------------------|----------------------------|
| 1 | [vanitygaps](https://dwm.suckless.org/patches/vanitygaps/) | `gappih/gappiv/gappoh/gappov`, `smartgaps`, `incrgaps()` etc. | `window_gap`, `gapless_mode` |
| 2 | [cfacts](https://dwm.suckless.org/patches/cfacts/) | `setcfact()` — resize a client's share of its stack | closest thing to `bspc node -z` on a tiled window |
| 3 | [push](https://dwm.suckless.org/patches/push/) | `pushup()`/`pushdown()` — move a client through the stack list | closest thing to `bspc node -s north/south` |
| 4 | [fullscreen](https://dwm.suckless.org/patches/fullscreen/) | `fullscreen()` — true fullscreen, hides bar, restores previous layout on toggle | `bspc node -t fullscreen` |
| 5 | [restartsig](https://dwm.suckless.org/patches/restartsig/) | `quit()` takes `arg.i`: `1` = restart in place via `execvp`, `0` = quit. Also `SIGHUP`/`SIGTERM` handlers. | `bspc wm -r` |
| 6 | [moveresize](https://dwm.suckless.org/patches/moveresize/) | `moveresize()` — keyboard move/resize, **floating clients only** | partial: `bspc node -z` (only the floating case) |
| 7 | [pertag](https://dwm.suckless.org/patches/pertag/) | keeps layout/mfact/nmaster/barpos per tag instead of global — apply **last** | bspwm desktops already behave this way by default |

There's a combined `cfacts`+`vanitygaps` diff on the vanitygaps page
(`dwm-cfacts-vanitygaps-6.4_combo.diff`) if you want to avoid merge
conflicts between #1 and #2 — worth grabbing instead of the two separate
diffs.

Grab whichever `.diff` version matches your cloned dwm's version tag
(`dwm -v`), apply with `patch -p1 < the.diff` from inside the source tree,
resolve any offset/fuzz conflicts by hand, then merge the resulting
`config.def.h` additions into your own `config.h` (the `config.h` in this
folder already has that merge done for you).

## 3. Two things that are NOT official patches

These bind to functions that don't exist anywhere in the suckless tree.
You add them to `dwm.c` yourself.

### `centerfloating()` — for `super+c` (replaces `centre.sh`)

The official `center`/`alwayscenter` patches only auto-center floating
windows *when they open*, via a rule — there's no keybinding to center
the currently focused floating window on demand. Add this near the other
`static void` functions in `dwm.c`, and add the prototype to the
forward-declaration block:

```c
static void centerfloating(const Arg *arg);
```

```c
void
centerfloating(const Arg *arg)
{
	Client *c = selmon->sel;
	if (!c || !c->isfloating)
		return;
	resize(c,
		selmon->mx + (selmon->mw - WIDTH(c)) / 2,
		selmon->my + (selmon->mh - HEIGHT(c)) / 2,
		c->w, c->h, 0);
}
```

### `killalltag()` — for `super+shift+q` (replaces `bspc query -N -d focused | xargs bspc node -c`)

There's a `killunsel` patch and a `bulkill` patch upstream, but neither
does exactly "close every client on the current tag" — this mirrors what
`killclient()` already does in `dwm.c`, just looped over every visible
client instead of only `selmon->sel`:

```c
static void killalltag(const Arg *arg);
```

```c
void
killalltag(const Arg *arg)
{
	Client *c;
	for (c = selmon->clients; c; c = c->next) {
		if (!ISVISIBLE(c))
			continue;
		if (!sendevent(c, wmatom[WMDelete])) {
			XGrabServer(dpy);
			XSetErrorHandler(xerrordummy);
			XSetCloseDownMode(dpy, DestroyAll);
			XKillClient(dpy, c->win);
			XSync(dpy, False);
			XSetErrorHandler(xerror);
			XUngrabServer(dpy);
		}
	}
}
```

## 4. Optional: bspwm-style window hide/minimize (`super+m` / `super+alt+m`)

There is **no official suckless patch for this** — I checked the full
patch index and only "hide vacant tags" (a bar thing, unrelated) and
"hideborder" exist under that name. What people actually use is a
community diff:
[theniceboy/dwm-hide-and-restore-win.diff](https://github.com/theniceboy/dwm-hide-and-restore-win.diff),
which adds `hidewin()`/`restorewin()` — but **it depends on the
`awesomebar` patch** being applied first, which is a bigger, more
invasive bar patch you may not otherwise want.

Two honest options:
- Apply `awesomebar` + that community diff if you want exact parity.
- Or lean into how dwm normally handles this: send the window to a spare
  tag (`super+shift+9` to a tag you never view) instead of "hiding" it —
  that's the idiomatic dwm equivalent and needs zero patches. I left
  `super+m`/`super+alt+m` commented out in `config.h` pending your call.

## 5. Things that genuinely don't translate — not a config.h problem, an architecture one

bspwm tiles windows on a **binary tree** with real spatial positions
(north/south/east/west). dwm tiles on a **master + stack list** — there's
no concept of "the window to my left." So these sxhkd bindings have no
faithful dwm equivalent, patched or not:

- `super + ctrl + {h,j,k,l}` (preselect direction) and
  `super + ctrl + shift + {h,j,k,l}` (preselect ratio) — bspwm-only concept.
- `super + r` (`bspc node -R`, rotate the tree 90°) — no tree to rotate.
- `super + ctrl` alone, no key (`bspc node -E`, equalize split ratios) —
  this line in your `sxhkdrc` also has no keysym after the modifiers,
  so it's likely dead/unbound in sxhkd itself; worth double-checking.
- `super + alt + {h,j,k,l}` (swap with window in a *direction*, follow) —
  `push` (used above) only knows "up/down the stack list," not direction.
- `super + space` (`bspc node -s biggest.local`) — dwm has no "biggest
  window" concept; I mapped this to `zoom` (swap with master) as the
  nearest analogue, since the master is usually the largest pane anyway.

None of this is a gap in the config — it's the actual difference between
manual/binary-tree tiling (bspwm) and dynamic master-stack tiling (dwm).
If losing spatial navigation is a dealbreaker, it's worth knowing before
you sink an evening into patching.

## 6. Already native, no patch needed

- Mouse move/resize: bspwm's `pointer_modifier mod4` + `pointer_action1
  move` / `pointer_action3 resize_corner` is just `MODKEY+Button1` drag /
  `MODKEY+Button3` drag in stock dwm — already in the `buttons[]` array
  in `config.h`.
- `super+t` / `super+s` (tiled/floating) — stock `setlayout`/`togglefloating`.
- `monocle` layout already has no gaps and gets close to
  `borderless_monocle` for free, since the vanitygaps patch above never
  touches `monocle()`.

## 7. xkb layout (`setxkbmap -layout us,ru -option grp:alt_shift_toggle`)

dwm doesn't run anything at startup by itself. Simplest route: put that
line in `~/.xinitrc` (or your login manager's dwm session script) right
before `exec dwm`. If you'd rather have it live inside dwm's own config,
that's the `autostart` patch (runs `~/.dwm/autostart.sh`) — not needed
just for this one line.
