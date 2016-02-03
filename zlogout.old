# -*- shell-script -*-

# Encryptfs dismounts $HOME on logout but if you're running tmux
# (screen as well?) then when you reconnect to tmux you will get
# the error:
# Fatal: Could not change back to '(unreachable)/<your current dir>': No such file or directory
#
# This only occurs when using Encryptfs to encrypt the home directory. If the
# entire hard drive is encrypted via dmcrypt then this problem doesn't occur.
if tmux ls 2>&1 >/dev/null; then
  # tmux is still running, do not auto-unmount
  rm $HOME/.ecryptfs/auto-umount
else
  # no tmux server, auto-unmount is OK.
  touch $HOME/.ecryptfs/auto-umount
fi

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
