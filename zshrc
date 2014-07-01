# -*- shell-script -*-

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

if [ -n "$INSIDE_EMACS" ]; then
    export ZSH_THEME="rawsyntax"
else
    export ZSH_THEME="robbyrussell"
fi
#export ZSH_THEME="alanpeabody"
#export ZSH_THEME="suvash"
#export ZSH_THEME="gnzh"

export LANG='en_AU.utf8'
export LC_CTYPE='en_AU.UTF-8'
#export LC_CTYPE=C

#export MAIL=$HOME/Maildir/local
#export MAILDIR=$HOME/Maildir/local
#export MAIL=~/Mailbox
export MAIL=/var/mail/$USER

export EDITOR=emacsclient
setopt hist_ignore_all_dups

export MANWIDTH=96

export TERM=xterm-256color
#export TERM=screen-256color-bce
#export TERM=screen-256color
[ -n "$TMUX" ] && export TERM=screen-256color
[ -n "$EMACS" ] && export TERM=eterm-color

autoload -U colors
colors


export HISTFILESIZE=
export HISTSIZE=


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
plugins=(command-not-found custom-aliases rails)

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

#export _JAVA_AWT_WM_NONREPARENTING=1

# if [ -d "$HOME/apps/eclipse" ]; then
#   PATH=$PATH:$HOME/apps/eclipse
# fi

if [ -d "$HOME/android-sdk-linux/platform-tools" ]; then
  PATH=$PATH:$HOME/android-sdk-linux/platform-tools
fi

if [ -d "$HOME/android-sdk-linux/tools" ]; then
  PATH=$PATH:$HOME/android-sdk-linux/tools
fi

if [[ -f "$HOME/.aws_keys" ]]; then
  source "$HOME/.aws_keys";
fi

### Added by the Heroku Toolbelt
if [ -d "/usr/local/heroku/bin" ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -d "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/apps/scala/bin" ]; then
  export SCALA_HOME=$HOME/apps/scala
  export PATH="$SCALA_HOME/bin:$PATH"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ -d "/usr/lib/jvm/java-7-oracle" ]; then
  export JAVA_HOME="/usr/lib/jvm/java-7-oracle"
fi

source $ZSH/oh-my-zsh.sh

#unsetopt correct_all

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


P() {
  echo $PATH | tr -s ':' '\n'
}

D()
{
  if [ $# -eq 0 ]; then
    z=0
    for i in `dirs`; do
      echo $z $i
      z=$((z+1))
    done
  elif [ $1 -gt 0 ]; then
    pushd +$1
  elif [ $1 -lt 0 ]; then
    z=$1
    popd +$((-z))
  else
    echo d: Broken
  fi
}
