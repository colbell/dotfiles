source $BYOBU_PREFIX/share/byobu/profiles/tmux

# Start window and pane numbering at 1.
set -g base-index 1
setw -g pane-base-index 1

# Yes - UTF8
set -g status-utf8 on

# Monitor windows
setw -g monitor-activity on
set -g visual-activity on

# Get tmux and rvm working together.
# set -g default-command "$SHELL --login"
# set -g default-shell $SHELL

set-option -ga update-environment ' GEM_HOME GEM_PATH MY_RUBY_HOME PATH'