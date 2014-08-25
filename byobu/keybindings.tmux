unbind-key -n C-a
unbind-key -n C-o
set -g prefix ^O
set -g prefix2 ^O
bind o send-prefix
source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable
