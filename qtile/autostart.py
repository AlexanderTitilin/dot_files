
import os
import subprocess
from libqtile import hook,qtile

@hook.subscribe.startup_once
def autostart():
    autostart_script = "autostart.sh"
    home = os.path.expanduser(f"~/.config/qtile/{autostart_script}")
    subprocess.Popen([home])


