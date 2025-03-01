from libqtile import widget, bar, qtile
from libqtile.config import Screen
from dataclasses import dataclass


@dataclass(frozen=True, order=False)
class Colors():
    fg1 = '#DCD7BA'
    color2 = '#504945'
    fg2 = '#ddc7a1'
    color3 = '#1F1F28'
    color4 = '#a89984'
    color5 = '#7daea3'
    color6 = '#a9b665'
    color7 = '#d8a657'
    color8 = '#d3869b'
    color9 = '#ea6962'
    oni_violet = '#957FB8'


colors = Colors()

widget_defaults = dict(font="JetBrains Mono Nerd Font ",
                       fontsize=25 if qtile.core.name == "wayland" else 30,
                       padding=3,
                       padding_x=1,
                       background=colors.color3,
                       foreground=colors.fg1)
extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox("  "),
                widget.Prompt(),
                widget.GroupBox(
                    padding=1,
                    highlight_method="line",
                    highlight_color=[colors.color3, colors.color3],
                    this_current_screen_border=colors.color7,
                    urgent_border=colors.color9,
                    disable_drag=True,
                    hide_unused=True,
                ),

                widget.Spacer(),
                widget.Clock(format="%H:%M",
                             foreground=colors.color7),
                widget.Spacer(),
                widget.Wlan(),
                widget.Battery(discharge_char="󰁹", charge_char="󰂄",
                               format="{char}|{percent:2.0%}", ),
                widget.TextBox("  "),
            ],
            33,
        ),
        wallpaper="~/.config/qtile/wallpaper.jpg",
        wallpaper_mode="fill"),
]
