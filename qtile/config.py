import subprocess
import autostart
from libqtile import hook
from keys import *
from autostart import *
from bar import *
from layouts import *
import os


dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False


auto_minimize = True


wl_input_rules = {
}
if qtile.core.name == "wayland":
    from wl_input import *

wmname = "LG3D"
