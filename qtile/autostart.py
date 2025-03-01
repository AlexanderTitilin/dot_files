import os
import subprocess
from libqtile import hook, qtile


@hook.subscribe.startup_once
def autostart():
    autostart_script = "autostart.sh"
    if qtile.core.name == "wayland":
        autostart_script = "autostart_wayland.sh"
    home = os.path.expanduser(f"~/.config/qtile/{autostart_script}")
    subprocess.Popen([home])
