 #!/bin/sh

xrandr --auto --output eDP-1
xrandr --auto --output HDMI-2 --right-of eDP-1
xrandr --auto --output DP-1 --right-of HDMI-2
xrandr --output eDP-1 --primary
