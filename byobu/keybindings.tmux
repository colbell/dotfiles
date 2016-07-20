# unbind-key -n C-a
# unbind-key -n C-o
# set -g prefix ^O
# set -g prefix2 ^O
#source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable
source $BYOBU_PREFIX/share/byobu/keybindings/tmux-screen-keys.conf
unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix
