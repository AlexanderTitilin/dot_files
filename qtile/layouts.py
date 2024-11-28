from libqtile import layout

layout_config = {
    "border_width": 0,
    "border_focus": "#d8a657",
    "border_normal": '#1F1F28',
    "ratio": 0.5,
}
layouts = [
    layout.Spiral(new_client_position="after_current", **layout_config),
    layout.MonadWide(**layout_config),
]
floating_layout = layout.Floating(border_width=0)
