 #!/bin/sh

xrandr --auto --output LVDS1
xrandr --auto --output DP1 --right-of LVDS1
xrandr --output LVDS1 --primary

