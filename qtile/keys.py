from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.config import Click, Drag, Group, Key, KeyChord
from libqtile import qtile
from copy import deepcopy
mod = "mod4"
terminal = "alacritty"
launcher_command = 'rofi -font "JetBrais Mono 20" -show run'
browser = "firefox"



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
        ],
    ),
]
workspases = zip(["a", "b", "c", "d", "f", "g"], [0, 0, 0, 1, 1, 1])
groups = [Group(i, screen_affinity=a) for i, a in workspases]


def go_to_group(name: str):
    def _inner(qtile):
        if len(qtile.screens) == 1:
            qtile.groups_map[name].toscreen()
            return

        if name in 'abc':
            qtile.focus_screen(0)
            qtile.groups_map[name].toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].toscreen()

    return _inner


def go_to_group_and_move_window(name: str):
    def _inner(qtile):
        if len(qtile.screens) == 1:
            qtile.current_window.togroup(name, switch_group=True)
            return

        if name in "abc":
            qtile.current_window.togroup(name, switch_group=False)
            qtile.focus_screen(0)
            qtile.groups_map[name].toscreen()
        else:
            qtile.current_window.togroup(name, switch_group=False)
            qtile.focus_screen(1)
            qtile.groups_map[name].toscreen()

    return _inner


def move_window(name: str):
    def _inner(qtile):
        if len(qtile.screens) == 1:
            qtile.current_window.togroup(name, switch_group=True)
            return

        if name in "123":
            qtile.current_window.togroup(name, switch_group=False)
            qtile.groups_map[name].toscreen()
        else:
            qtile.current_window.togroup(name, switch_group=False)
            qtile.groups_map[name].toscreen()

    return _inner


for i in groups:
    keys.append(Key([mod, "shift"], i.name, lazy.function(
        go_to_group_and_move_window(i.name))))
for j, i in enumerate(groups, 1):
    keys.extend(
        [
            Key(
                [mod],
                str(j),
                lazy.function(go_to_group(i.name)),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                str(j),
                lazy.function(go_to_group_and_move_window(i.name)),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            Key(
                [mod, "control"],
                str(j),
                lazy.function(move_window(i.name)),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
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
