
import os
import subprocess
from libqtile import hook,qtile

@hook.subscribe.startup_once
def autostart():
    backend = qtile.core.name
    autostart_script = "autostart.sh"
    if backend == "wayland":
        autostart_script = "autostart_wayland.sh"
    home = os.path.expanduser(f"~/.config/qtile/{autostart_script}")
    subprocess.Popen([home])


