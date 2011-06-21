#! /bin/sh

[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources

host=`hostname`

if [ -x /usr/bin/gnome-settings-daemon ] ; then
  gnome-settings-daemon &
fi

sleep 1

if [ $host = sandman ] ; then
  xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
  xrandr --addmode VGA-0 1680x1050_60.00
  xrandr --output LVDS --primary --mode 1280x800
  xrandr --auto --output VGA-0 --mode 1680x1050_60.00 --right-of LVDS
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

if [ $host = lankhmar ] ; then
  xrandr --auto --output LVDS --mode 1280x800
  xrandr --auto --output VGA-0 --mode 1680x1050 --right-of LVDS
  xrandr --output LVDS --primary
fi

#if [ -x /usr/bin/gnome-power-manager ] ; then
#   gnome-power-manager &
#fi
#if [ -x /usr/bin/nm-applet ] ; then
#  nm-applet --sm-disable &
#fi
# if [ -x /usr/bin/seahorse-daemon ] ; then
#   seahorse-daemon &
# fi
#if [ -x /usr/bin/ubuntuone-launch ] ; then
#  ubuntuone-launch &
#fi
#if [ -x /usr/bin/update-notifier ] ; then
#  update-notifier --startup-delay=60 &
#fi

#if [ -x /usr/bin/wicd-client ] ; then
#  wicd-client &
#fi

if [ -x /usr/bin/wuala ] ; then
  wuala --startTrading &
fi


#if [ -x /usr/bin/trayer ] ; then
# # #margin=1680
# trayer --edge top  --align right --SetDockType true --SetPartialStrut true  --expand true --width 6 --tint 0xFFFFFF --height 16 &
# # #trayer --edge top --margin 1680 --align right --SetDockType true --SetPartialStrut true  --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
#fi

# FG='#a8a3f7' 
# BG='#3f3c6d'
# while true ; do date ; sleep 60 ; done | dzen2 -e '' -x 400 -w $off -ta r -fg $FG -bg $BG -p &

# Java/awesome fix
_JAVA_AWT_WM_NONREPARENTING=1; export _JAVA_AWT_WM_NONREPARENTING

#DEFAULT_SESSION=awesome
#if [ $host = olethros ] ; then
#  DEFAULT_SESSION=xmonad
#fi

#case $1 in
#  awesome) ck-launch-session dbus-launch --exit-with-session awesome ;;
#  xmonad) ck-launch-session dbus-launch --exit-with-session xmonad ;;
#  *) ck-launch-session dbus-launch --exit-with-session $DEFAULT_SESSION ;;
#esac

#exec awesome
#exec xmonad

DEFAULT_SESSION=/usr/bin/openbox-session

if [ -z $1 ]
then
 session=awesome
else
session=${1}
fi

case $session in
awesome)
  # Start tint2 (panel)
  # tint2 works with awesome, but was disabled by default.
  #(nohup /usr/bin/tint2 &)

  # Start wicd client
  (nohup /usr/bin/wicd-client &)

  # Start volume panel applet
  (nohup /usr/bin/volumeicon &)

  # Start cairo composite manager
  # Cairo works, but was disabled
  if [ -x /usr/bin/cairo-compmgr ] ; then
    (nohup /usr/bin/cairo-compmgr &)
  fi

  # Start xfce4-power-manager
  (nohup /usr/bin/xfce4-power-manager &)


  if [ -x /usr/bin/xscreensaver ] ; then
    (nohup /usr/bin/xscreensaver -no-splash &)
  fi

  # if [ -x /usr/bin/batterymon ] ; then
  #   (nohup /usr/bin/batterymon &)
  # fi

  if [ -x /usr/bin/dropboxd ] ; then
    (nohup /usr/bin/dropboxd &)
  elif [ -x /usr/bin/dropbox ] ; then
    (nohup /usr/bin/dropbox start &)
  elif [ -x $HOME/apps/dropbox/dropboxd ] ; then
    (nohup $HOME/apps/dropbox/dropboxd start &)
  fi

  if [ -x /usr/bin/ssh-agent ] ; then
    eval `ssh-agent`
  fi

  if [ -x /usr/bin/conky ] ; then
    (nohup /usr/bin/conky -d)
  fi

  dbus-launch --exit-with-session awesome
  #exec /usr/bin/awesome
  ;;
# These window managers are examples if you add them
#xfce4)
#       exec startxfce4
#       ;;
#icewm)
#       icewmbg &
#       icewmtray &
#       exec icewm
#       ;;
#wmaker)
#       exec wmaker
#       ;;
#blackbox)
#       exec blackbox
#       ;;
openbox)
  exec /usr/bin/openbox-session
  ;;
*)
  exec $DEFAULT_SESSION
  ;;
esac

