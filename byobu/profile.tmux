source $BYOBU_PREFIX/share/byobu/profiles/tmux

# Start window and pane numbering at 1.
set -g base-index 1
setw -g pane-base-index 1

# Yes - UTF8
set -g status-utf8 on

# Monitor windows
setw -g monitor-activity on
set -g visual-activity on