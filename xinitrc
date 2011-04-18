#! /bin/sh

[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources

xsetroot -cursor_name left_ptr
#xsetroot -solid '#80a0af'
#xsetroot -solid midnightblue
#xsetroot -solid DarkGoldenrod
#xsetroot -solid '#5f0f1f'
#xsetroot -solid '#dcdccc'
xsetroot -solid '#3f3f3f'

host=`hostname`

if [ -x /usr/bin/gnome-settings-daemon ] ; then
  gnome-settings-daemon &
fi

sleep 1

if [ $host = teleute] ; then
  xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
  xrandr --addmode VGA-0 1680x1050_60.00
  xrandr --auto --output VGA-0 --mode 1680x1050_60.00 --right-of LVDS
  xrandr --output LVDS --primary
fi

if [ $host = olethros ] ; then
  xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
  xrandr --addmode VGA1 1680x1050_60.00
  xrandr --auto --output HDMI1 --mode 1920x1080
  xrandr --auto --output VGA1 --mode 1680x1050_60.00 --right-of HDMI1
  xrandr --output HDMI1 --primary
fi

if [ $host = tux ] ; then
  xrandr --auto --output VBOX0 --mode 1280x800
  xrandr --auto --output VBOX1 --mode 1024x768 --left-of VBOX0
  xrandr --output VBOX1 --primary
fi

if [ $host = tux || $host = arch ] ; then
  if [ -x /usr/bin/trayer ] ; then
     trayer --edge top  --align right --monitor 0 --SetDockType true --SetPartialStrut true  --expand true --widthtype request --tint 0xFFFFFF --height 16 &
    if [ -x /usr/bin/xscreensaver ] ; then
      xscreensaver -no-splash &
    fi

    if [ -x /usr/bin/batterymon ] ; then
      batterymon &
    fi
  fi
fi

if [ -x /usr/bin/dropboxd ] ; then
  dropboxd&
fi

#if [ -x /usr/bin/xscreensaver ] ; then
#  xscreensaver -no-splash &
#fi

#if [ -x /usr/bin/gnome-screensaver ] ; then
#  gnome-screensaver &
#fi

# if [ -x /usr/bin/gnome-keyring-daemon ] ; then
#   gnome-keyring-daemon &
# fi

#if [ -x /usr/bin/gnome-volume-control-applet ] ; then
#  gnome-volume-control-applet &
#fi

# This must be started before seahorse-daemon.
# eval $(gnome-keyring-daemon)
# export GNOME_KEYRING_CONTROL
# export GNOME_KEYRING_PID
# export SSH_AUTH_SOCKET

if [ -x /usr/bin/gnome-panel ] ; then
  gnome-panel &
fi
if [ -x /usr/bin/gnome-power-manager ] ; then
   gnome-power-manager &
fi
if [ -x /usr/bin/nm-applet ] ; then
  nm-applet --sm-disable &
fi
if [ -x /usr/bin/seahorse-daemon ] ; then
  seahorse-daemon &
fi
if [ -x /usr/bin/ubuntuone-launch ] ; then
  ubuntuone-launch &
fi
if [ -x /usr/bin/update-notifier ] ; then
  update-notifier --startup-delay=60 &
fi


#if [ $host = teleute ] ; then
#  xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
#  xrandr --addmode CRT1 1680x1050_60.00
#  #xrandr --auto --output LVDS --mode 1280x768
#  xrandr --auto --output LVDS --mode 1280x800
#  xrandr --auto --output CRT1 --mode 1680x1050_60.00 --right-of LVDS
#  xrandr --output LVDS --primary
#fi

#if [ -x /usr/bin/trayer ] ; then
 # #margin=1680
 # trayer --edge top  --align right --SetDockType true --SetPartialStrut true  --expand true --width 6 --tint 0xFFFFFF --height 16 &
 # #trayer --edge top --margin 1680 --align right --SetDockType true --SetPartialStrut true  --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
#fi



# if [ -x /usr/bin/stalonetray ] ; then
#   stalonetray -i 16 --icon-gravity E --max-geometry 12x1 --geometry 12x1-0+0 -bg '#000000' --sticky --skip-taskbar &
#   #stalonetray -i 16 --icon-gravity E -bg '#000000' --sticky --skip-taskbar &
# fi

FG='#a8a3f7' 
BG='#3f3c6d'
while true ; do date ; sleep 60 ; done | dzen2 -e '' -x 400 -w $off -ta r -fg $FG -bg $BG -p &

dbus-launch --exit-with-session xmonad
#exec xmonad
