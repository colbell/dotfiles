#! /bin/sh

[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources

host=`hostname`

xsetroot -cursor_name left_ptr
xsetroot -solid darkgray

if [ -x /usr/bin/trayer ] ; then
  trayer --edge top  --align right --SetDockType true --expand false --SetPartialStrut true --width 10 --height 19 --margin 0 --transparent true --alpha 0 --tint 0x000000 &
fi

if [ -x /usr/bin/mate-settings-daemon ] ; then
  (nohup /usr/bin/mate-settings-daemon &)
fi

# Wait for mate-settings-daemon.
sleep 1

if [ -x ~/.bin/xmenud.py ] ; then
  (nohup ~/.bin/xmenud.py --tray &)
fi

if [ -x /usr/bin/nm-applet ] ; then
  (nohup /usr/bin/nm-applet &)
fi

if [ -x /usr/bin/mate-power-manager ] ; then
  (nohup /usr/bin/mate-power-manager &)
fi

if [ -x /usr/bin/update-notifier ] ; then
  (nohup update-notifier --startup-delay=60 &)
fi

if [ -x /usr/bin/dropbox ] ; then
  (nohup dropbox start -i &)
fi

# Started by mate-settings.
# if [ -x /usr/bin/pulseaudio ] ; then
#   (nohup /usr/bin/pulseaudio --start &)
# fi

if [ -x /usr/bin/xscreensaver ] ; then
  killall gnome-screensaver &
  killall mate-screensaver &
  (nohup /usr/bin/xscreensaver -no-splash &)
fi

if [ -x /usr/bin/xfce4-clipman ] ; then
  (nohup /usr/bin/xfce4-clipman &)
fi

if [ -x /usr/bin/system-config-printer-applet ] ; then
  (nohup /usr/bin/system-config-printer-applet &)
fi

#~/.bin/video on

# if [ -x /usr/bin/variety ] ; then
#   /usr/bin/variety &
# fi

# First run 'feh --bg-scale /path/to/image.file'
# if [ -x /usr/bin/feh ] ; then
#   sh ~/.fehbg &
# fi

# if [ -x /usr/bin/ssh-agent ] ; then
#   eval `/usr/bin/ssh-agent`
# fi

if [ -x /usr/bin/blueman-applet ] ; then
  (nohup /usr/bin/blueman-applet &)
fi

if [ -x /usr/bin/mate-volume-control-applet ] ; then
  (nohup /usr/bin/mate-volume-control-applet &)
fi

if [ -x /usr/lib/x86_64-linux-gnu/polkit-mate/polkit-mate-authentication-agent-1 ] ; then
  (nohup /usr/lib/x86_64-linux-gnu/polkit-mate/polkit-mate-authentication-agent-1 &)
fi

if [ -x /usr/bin/conky ] ; then
  (sleep 2 && /usr/bin/conky -d)&
fi

# if [ $host = sandman ] ; then
#   xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
#   xrandr --addmode VGA-0 1680x1050_60.00
#   xrandr --output LVDS --primary --mode 1280x800
#   xrandr --auto --output VGA-0 --mode 1680x1050_60.00 --right-of LVDS
# fi


# FG='#a8a3f7'
# BG='#3f3c6d'
# while true ; do date ; sleep 60 ; done | dzen2 -e '' -x 400 -w $off -ta r -fg $FG -bg $BG -p &

# Java/awesome fix
#_JAVA_AWT_WM_NONREPARENTING=1; export _JAVA_AWT_WM_NONREPARENTING

#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
dbus-launch --exit-with-session xmonad
