#! /bin/sh

host=`hostname`

if [ $host = teleute ] ; then
  xrandr --output LVDS --primary
fi

#if [ -x /usr/bin/trayer ] ; then
  #margin=1680
  #if [ $host = delirium ] ; then
  #  margin=1280
  #fi
  #if [ $host = olethros ] ; then
  #  margin=1920
  #fi

 #trayer --edge top --margin $margin --align right --SetDockType true --SetPartialStrut true  --expand true --width 10 --transparent true --tint 0x000000 --height 13 &
 #trayer --edge top --margin 1680 --align right --SetDockType true --SetPartialStrut true  --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
 #trayer --edge left --align center --SetDockType true --SetPartialStrut true  --expand true --widthtype request --transparent true --heighttype request &
#fi

if [ -x /usr/bin/stalonetray ] ; then
  stalonetray -i 16 --icon-gravity E --max-geometry 12x1 --geometry 12x1-0+0 -bg '#000000' --sticky --skip-taskbar &
  #stalonetray -i 16 --icon-gravity E -bg '#000000' --sticky --skip-taskbar &
fi

#if [ -x /usr/bin/xscreensaver ] ; then
#  xscreensaver -no-splash &
#fi

if [ -x /usr/bin/gnome-settings-daemon ] ; then
  gnome-settings-daemon &
fi

#if [ -x /usr/bin/gnome-screensaver ] ; then
#  gnome-screensaver &
#fi

if [ -x /usr/bin/gnome-keyring-daemon ] ; then
  gnome-keyring-daemon &
fi

if [ -x /usr/bin/gnome-volume-control-applet ] ; then
  gnome-volume-control-applet &
fi

sleep 3
if [ -x /usr/bin/gnome-power-manager ] ; then
   gnome-power-manager &
fi

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

if [ -x /usr/bin/ubuntuone-launch ] ; then
  ubuntuone-launch &
fi

if [ $host = olethros ] ; then
  xrandr --auto --output HDMI1 --mode 1920x1080
  xrandr --auto --output VGA1 --mode 1920x1080 --right-of HDMI1
  xrandr --output HDMI1 --primary
fi

#if [ $host = teleute ] ; then
#  xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
#  xrandr --addmode CRT1 1680x1050_60.00
#  #xrandr --auto --output LVDS --mode 1280x768
#  xrandr --auto --output LVDS --mode 1280x800
#  xrandr --auto --output CRT1 --mode 1680x1050_60.00 --right-of LVDS
#  xrandr --output LVDS --primary
#fi

#xsetroot -solid midnightblue
#xsetroot -solid DarkGoldenrod
#xsetroot -solid '#5f0f1f'

exec xmonad
