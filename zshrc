# -*- shell-script -*-

export ZSH=$HOME/.oh-my-zsh

if [ -n "$INSIDE_EMACS" ]; then
    export ZSH_THEME="robbyrussell"
else
    #export ZSH_THEME="gnzh"
    #export ZSH_THEME="alanpeabody"
    #export ZSH_THEME="robbyrussell"
    export ZSH_THEME="suvash"
fi

export LANG='en_AU.utf8'
export LC_CTYPE='en_AU.UTF-8'
#export LC_CTYPE=C

#export MAIL=$HOME/Maildir/local
#export MAILDIR=$HOME/Maildir/local
#export MAIL=~/Mailbox
export MAIL=/var/mail/$USER

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR=emacsclient
  export ALTERNATE_EDITOR=emacs
fi

export MANWIDTH=96

# export TERM=linux
# export TERM=xterm-256color
# [ -n "$DISPLAY" ] && export TERM=xterm-256color
# [ -n "$TMUX" ] && export TERM=screen-256color
[ -n "$INSIDE_EMACS" ] && export TERM=eterm-color

autoload -U colors
colors

export HISTFILESIZE=2500        # Not sure if used.
export HISTSIZE=$HISTFILESIZE   # Lines of hist stored in memory
export SAVEHIST=2000            # Lines of hist stored on disk
setopt EXTENDED_HISTORY         # save timestamp and runtime information
setopt HIST_IGNORE_ALL_DUPS
export HISTIGNORE=",:r:h:l"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Recent versions of Fedora have renamed qmake.
if grep -iq 'id=fedora' /etc/os-release; then
  export QMAKE=/usr/bin/qmake-qt4
fi

# Work around for Google Chrome not accepting keyboard input in addressbar
# https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/1307648
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(command-not-found custom-aliases rails lein)

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

# if [ -d "$HOME/apps/eclipse" ]; then
#   PATH=$PATH:$HOME/apps/eclipse
# fi

if [ -d "$HOME/android-sdk-linux/platform-tools" ]; then
  PATH=$PATH:$HOME/android-sdk-linux/platform-tools
fi

if [ -d "$HOME/android-sdk-linux/tools" ]; then
  PATH=$PATH:$HOME/android-sdk-linux/tools
fi

### Added by the Heroku Toolbelt
if [ -d "/usr/local/heroku/bin" ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d "$HOME/apps/eb" ]; then
  export PATH="$PATH:$HOME/apps/eb"
fi

if [[ -f "$HOME/.aws_keys" ]]; then
  source "$HOME/.aws_keys";
fi

if [ -d "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Emacs seems to need a trailing : character on the path otherwise
# it ignores the value of $PATH and just uses the standard system path.
export PATH="$PATH:"

# if [ -d "$HOME/apps/scala/bin" ]; then
#   export SCALA_HOME=$HOME/apps/scala
#   export PATH="$SCALA_HOME/bin:$PATH"
# fi

# if [ -d "$HOME/apps/awseb/eb/linux/python2.7" ]; then
#   PATH=$HOME/apps/awseb/eb/linux/python2.7:$PATH
# fi

# if [ -d "/usr/lib/jvm/java-7-oracle" ]; then
#   export JAVA_HOME="/usr/lib/jvm/java-7-oracle"
# fi

source $ZSH/oh-my-zsh.sh

#unsetopt correct_all

if [ -f "$HOME/.zsh-aliases" ]; then
  source $HOME/.zsh-aliases
fi

if [ -f "$HOME/.zsh-funcs" ]; then
  source $HOME/.zsh-funcs
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'




# #local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"
# local smiley="%(?,%{$fg[green]%}✔%{$reset_color%},%{$fg[red]%}✘%{$reset_color%})"

# if [ -d "$HOME/.rbenv/bin" ]; then
#  local_ruby='%{$fg[white]%} $(rbenv_prompt_info) $(~/bin/git-cwd-info.rb)%{$reset_color%}'
# elif [ -d "$HOME/.rvm/bin" ]; then
#  local_ruby='%{$fg[red]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git-cwd-info.rb) %{$reset_color%}'
# else
#  local_ruby='%{$fg[red]%}[$(~/bin/git-cwd-info.rb)%{$reset_color%}'
# fi

# PROMPT='
# %{$fg[green]%}%n@%m:%{$reset_color%}%{$fg[yellow]%}%~%{$reset_color%}
# ${local_ruby}
# ${smiley} %{$reset_color%}%# '

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
