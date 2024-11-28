from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.config import Click, Drag, Group, Key, KeyChord
import copy
from libqtile import qtile
backend = qtile.core.name
mod = "mod4"
terminal = "alacritty"
screenshot = "flameshot gui"
launcher_command = 'rofi -font "Ubuntu Nerd Mono 20" -show drun'
if backend == "wayland":
    launcher_command = "wofi --show drun"
browser = "firefox"


translation = {
    "f": "Cyrillic_A",
    ",": "Cyrillic_BE",
    "w": "Cyrillic_TSE",
    "l": "Cyrillic_DE",
    "t": "Cyrillic_IE",
    'a': "Cyrillic_EF",
    'u': "Cyrillic_GHE",
    "[": "Cyrillic_HA",
    "b": "Cyrillic_I",
    "q": "Cyrillic_SHORTI",
    "r": "Cyrillic_KA",
    "k": "Cyrillic_EL",
    "v": "Cyrillic_EM",
    "y": "Cyrillic_EN",
    "j": "Cyrillic_O",
    "g": "Cyrillic_PE",
    "z": "Cyrillic_YA",
    "h": "Cyrillic_ER",
    "c": "Cyrillic_ES",
    "n": "Cyrillic_TE",
    ".": "Cyrillic_U",
    ";": "Cyrillic_ZHE",
    "d": "Cyrillic_VE",
    "m": "Cyrillic_SOFTSIGN",
    "s": "Cyrillic_YERU",
    "p": "Cyrillic_ZE",
    "i": "Cyrillic_SHA",
    "'": "Cyrillic_E",
    "o": "Cyrillic_SHCHA",
    "x": "Cyrillic_CHE",
}


def translate_key(key):
    key = copy.copy(key)
    key.key = translation[key.key]
    return key


keys = [
    Key([mod, "shift"], "space",
        lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle_fullscreen"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "j", lazy.layout.shrink(), desc="Shrink window"),
    Key([mod, "control"], "k", lazy.layout.grow(), desc="Grow window"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "d", lazy.spawn(launcher_command), desc="Run rofi"),
    Key([mod], "p", lazy.spawn(screenshot), desc="Run flameshot"),
    Key(
        [mod], "0", lazy.spawn(
            "rofi -show power-menu -modi power-menu:rofi-power-menu"),
        desc="Run rofi-power-menu"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "b", lazy.hide_show_bar(), desc="Hide bar"),
    KeyChord(
        [mod],
        "a",
        [
            Key([], "1", lazy.spawn(
                f"{terminal} -e nvim"), desc="Run neovim"),
            Key([], "2", lazy.spawn(f"{browser}"), desc=f"Run {browser}"),
            Key([], "3", lazy.spawn(
                f"{browser} web.telegram.org"), desc="Run telegram"),
            Key([], "4", lazy.spawn(
                f"{terminal} -e vifm"), desc="Run vifm"),
            Key([], "5", lazy.spawn(
                f"{terminal} -e ipython"), desc="Run ipython"),
            Key([], "w", lazy.spawn(
                f"{terminal} -e nmtui-connect"), desc="Run nmtui"),
        ],
    ),
    KeyChord(
        [mod],
        "r",
        [
            Key([], "j",
                lazy.layout.shrink_main().when(
                    layout=("spiral", "monadwide"))),
            Key([], "k", lazy.layout.grow_main().when(
                layout=("spiral", "monadwide"))),
            Key([], "h", lazy.layout.grow_left()),
            Key([], "l", lazy.layout.grow_right()),
            Key([], "n", lazy.layout.normalize()),
        ],
        mode=True
    ),
    Key([mod], "c", lazy.spawncmd())
]
if backend == "wayland":
    keys += [translate_key(key) for key in keys if key.key in translation]
groups = [Group(str(w)) for w in range(1,7)]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),

            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),

            Key(
                [mod, "control"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc=f"Switch to  to group {i.name}",
            ),
        ]
    )


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
