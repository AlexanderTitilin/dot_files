from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.config import Click, Drag, Group, Key, KeyChord
from libqtile import qtile
# from libqtile.backend.wayland import InputConfig
# from libqtile.backend.wayland.core import Core
mod = "mod4"
terminal = "alacritty"
launcher_command = 'rofi -font "JetBrais Mono 20" -show run'
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
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
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
            Key([], "1", lazy.spawn("alacritty -e nvim"), desc="Run neovim"),
            Key([], "2", lazy.spawn("firefox"), desc="Run firefox"),
            Key([], "3", lazy.spawn("firefox web.telegram.org"), desc="Run telegram"),
            Key([], "4", lazy.spawn("alacritty -e vifm"), desc="Run vifm"),
        ],
    ),
]
workspases = ["a", "b", "c", "d"]
groups = [Group(i) for i in workspases]


for j, i in enumerate(groups, 1):
    keys.extend(
        [
            Key(
                [mod],
                str(j),
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                str(j),
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            Key(
                [mod, "control"],
                str(j),
                lazy.window.togroup(i.name, switch_group=False),
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
