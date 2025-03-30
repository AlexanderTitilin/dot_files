from libqtile.backend.wayland import InputConfig

wl_input_rules = {
    "type:keyboard": InputConfig(
        kb_layout="us,ru",
        kb_options="grp:caps_toggle"
        )
    }

