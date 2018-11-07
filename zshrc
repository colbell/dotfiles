#
# sudo aptitude install zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=~/.oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man-pages colorize compleat mix zsh-autosuggestions)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

export MAIL=/var/mail/$USER

source $ZSH/oh-my-zsh.sh

#Load asdf version manager. I use it for installing Erlang/Elixir.
if [ -d "$HOME/.asdf" ]; then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi

setopt HIST_IGNORE_ALL_DUPS
unsetopt AUTO_CD

# You may need to manually set your language environment
# export LANG=en_AU.UTF-8

export GTAGSLABEL=pygments

export MANWIDTH=96

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable history in IEX
export ERL_AFLAGS="-kernel shell_history enabled"

# export TERM=xterm-256color
# [ -n "$DISPLAY" ] && export TERM=xterm-256color
# [ -n "$TMUX" ] && export TERM=screen-256color
# [ -n "$BYOBU_BACKEND" ] && export TERM=screen-256color
# [ -n "$INSIDE_EMACS" ] && export TERM=eterm-color

# Recent versions of Fedora have renamed qmake.
if grep -iq 'id=fedora' /etc/os-release; then
    export QMAKE=/usr/bin/qmake-qt4
fi

if [ -f "$HOME/.zsh-aliases" ]; then
    source $HOME/.zsh-aliases
fi

if [ -f "$HOME/.zsh-funcs" ]; then
    source $HOME/.zsh-funcs
fi

# if [[ -f "$HOME/.aws_keys" ]]; then
#     source "$HOME/.aws_keys";
# fi

# export DEFAULT_USER=colbell

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Always show scrollbars in Gnome. The default behaviour of
# only showing on mouse-over is incredibly irritating.
export GTK_OVERLAY_SCROLLING=0

# Work around for Google Chrome not accepting keyboard input in addressbar
# https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/1307648
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# export CLUTTER_IM_MODULE=ibus

# Wayland (as at Ubuntu Gnome 17.04) doesn't load ~/.Xresources at startup.
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  xrdb -merge $HOME/.Xresources
fi

if [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f "/usr/bin/aws_completer" ]; then
    complete -C '/usr/bin/aws_completer' aws
fi

# if [ -f "~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh" ]; then
#     source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh
#     zmodload zsh/terminfo
#     bindkey '^[[A' history-substring-search-up
#     bindkey '^[[B' history-substring-search-down
# fi

# autoload -U colors
# colors

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# added by `npm i local-bin-path`
export PATH=${PATH}:./node_modules/.bin
