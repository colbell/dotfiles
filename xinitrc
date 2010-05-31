#! /bin/sh

if [ -x /usr/bin/trayer ] ; then
 trayer --edge top --margin 1680 --align right --SetDockType true --SetPartialStrut true  --expand true --width 10 --transparent true --tint 0x000000 --height 13 &
 #trayer --edge top --margin 1680 --align right --SetDockType true --SetPartialStrut true  --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
 #trayer --edge left --align center --SetDockType true --SetPartialStrut true  --expand true --widthtype request --transparent true --heighttype request &
fi

gnome-keyring-daemon

#xscreensaver -no-splash &

#xsetroot -solid midnightblue
xsetroot -solid DarkGoldenrod
#xsetroot -solid '#5f0f1f'

sleep 3
if [ -x /usr/bin/gnome-power-manager ] ; then
   gnome-power-manager &
fi

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

host=`hostname`
if $host ; then
  if [ $host = delirium ] ; then
    xrandr --auto --output DVI-0 --mode 1920x1080
    xrandr --auto --output VGA-0 --mode 1280x1024 --right-of DVI-0
    xrandr --output DVI-0 --primary
  fi
fi

exec xmonad
